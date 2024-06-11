import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:skanicbills/util.dart';

class InvoiceWidget extends StatefulWidget {
  const InvoiceWidget({
    super.key,
    required this.invoiceIcon,
    required this.invoiceName,
    required this.invoicePaid,
    required this.invoiceTotal,
  });

  final IconData invoiceIcon;
  final String invoiceName;
  final int invoicePaid;
  final int invoiceTotal;

  @override
  State<StatefulWidget> createState() => _InvoiceWidgetState();
}

class _InvoiceWidgetState extends State<InvoiceWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(200, 97, 11, 239),
          title: Row(
            children: [
              MaterialButton(
                minWidth: 0,
                padding: const EdgeInsets.all(0),
                onPressed: (() => Util().getStatus()),
                child: const Icon(
                  IconData(0xe092, fontFamily: 'MaterialIcons', matchTextDirection: true),
                  color: Colors.black,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Bayar Tagihan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 0.75,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ],
          ),
          shadowColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: const [],
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(200, 97, 11, 239),
                Color.fromARGB(100, 97, 11, 239),
                Color.fromARGB(50, 98, 11, 239),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(width: 20),
                  Icon(widget.invoiceIcon, size: width / 2),
                  Text(
                    widget.invoiceName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 20, 19, 42),
                      fontSize: sx(25),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: sx(100),
                    height: sy(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 20, 20, 42),
                    ),
                  ),
                  SizedBox(height: sy(10)),
                  Text(
                    '${Util().numFormat(widget.invoicePaid)}/${Util().numFormat(widget.invoiceTotal)}\nTerbayar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 28, 28, 28),
                      fontSize: sx(15),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(100),
                    child: Form(
                      key: _formKey,
                      child: SizedBox(
                        height: sx(57),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  CurrencyInputFormatter(),
                                ],
                                decoration: InputDecoration(
                                    filled: false,
                                    hintText: Util().numFormat(500000),
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                                    )
                                    // border: const OutlineInputBorder(
                                    //   borderSide: BorderSide(color: Colors.white, width: 32.0),
                                    //   borderRadius: BorderRadius.only(
                                    //     topLeft: Radius.circular(10),
                                    //     bottomLeft: Radius.circular(10),
                                    //   ),
                                    // ),
                                    ),
                              ),
                            ),
                            Material(
                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                              color: const Color.fromARGB(255, 98, 11, 239),
                              child: MaterialButton(
                                padding: EdgeInsets.symmetric(vertical: sx(5), horizontal: sx(5)),
                                height: sx(65),
                                minWidth: sx(65),
                                hoverColor: const Color.fromARGB(255, 98, 11, 239).withOpacity(0),
                                splashColor: const Color.fromARGB(255, 98, 11, 239).withOpacity(0),
                                highlightColor: const Color.fromARGB(255, 98, 11, 239).withOpacity(0),
                                onPressed: () => print('Success!'),
                                child: Center(
                                  child: Icon(
                                    const IconData(0xe09b, fontFamily: 'MaterialIcons', matchTextDirection: true),
                                    color: Colors.white,
                                    size: sx(25),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 5),
                        width: width,
                        child: Text(
                          "Riwayat",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 20, 19, 42),
                            fontSize: sx(25),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Form(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: width / 1.09,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 252, 252, 252),
                                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    hintText: 'Cari...',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: sx(50),
                                height: sy(50),
                                child: Icon(
                                    const IconData(
                                      0xf068,
                                      fontFamily: 'MaterialIcons',
                                    ),
                                    size: sx(50)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
