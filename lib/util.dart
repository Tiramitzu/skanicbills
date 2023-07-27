import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:skanicbills/main.dart';
import 'package:skanicbills/screens/bills/students/dsp.dart';
import 'package:skanicbills/screens/bills/students/prakerin.dart';
import 'package:skanicbills/screens/bills/students/seragam.dart';
import 'package:skanicbills/screens/dashboard/student.dart';

class Util {
  void getStatus() async {
    await GetStorage.init();
    final box = GetStorage();
    if (box.read('email') == null) {
      runApp(const LoginScreen());
    } else {
      switch (box.read('level')) {
        case 0:
          {
            // runApp(const AdminDashboardApp());
          }
          break;
        case 4:
          {
            runApp(const StudentDashboardScreen());
          }
          break;
      }
    }
  }

  void redirectTo(String title) async {
    switch (title) {
      case 'DSP':
        {
          runApp(const DSPBillingScreen());
        }
        break;
      case 'Prakerin':
        {
          runApp(const PrakerinBillingScreen());
        }
        break;
      case 'Seragam':
        {
          runApp(const SeragamBillingScreen());
        }
        break;
    }
  }

  String securePassword(String privKey, String password) {
    String hashedPassword = Crypt.sha512(password, rounds: 777, salt: 'TiraIsTheBest.$privKey').toString();

    return hashedPassword;
  }

  String numFormat(int num) {
    var numFormat = NumberFormat("#,##0", "id_ID");

    return numFormat.format(num).replaceAll('.', ',');
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    int value = int.parse(newValue.text);

    final formatter = NumberFormat("#,##0", "id_ID");

    String newText = formatter.format(value).replaceAll('.', ',');

    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: newText.length));
  }
}
