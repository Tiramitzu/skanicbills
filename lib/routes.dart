import 'package:flutter/material.dart';
import 'package:skanicbills/main.dart';
import 'package:skanicbills/screens/bills/students/dsp.dart';
import 'package:skanicbills/screens/bills/students/prakerin.dart';
import 'package:skanicbills/screens/bills/students/seragam.dart';
import 'package:skanicbills/screens/dashboard/student.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/dashboard/student':
        return MaterialPageRoute(builder: (_) => const StudentDashboardScreen());
      case '/dashboard/student/bills/dsp':
        return MaterialPageRoute(builder: (_) => const DSPBillingScreen());
      case '/dashboard/student/bills/prakerin':
        return MaterialPageRoute(builder: (_) => const PrakerinBillingScreen());
      case '/dashboard/student/bills/seragam':
        return MaterialPageRoute(builder: (_) => const SeragamBillingScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

const String loginRoute = '/';
const String studentDashboardRoute = '/dashboard/student';
const String dspRoute = '/dashboard/student/bills/dsp';
const String prakerinRoute = '/dashboard/student/bills/prakerin';
const String seragamRoute = '/dashboard/student/bills/seragam';
