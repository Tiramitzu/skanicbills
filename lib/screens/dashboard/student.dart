import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:skanicbills/models/invoice.dart';
import 'package:skanicbills/util.dart';

void main() async {
  await GetStorage.init();
  Util().getStatus();
}

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SKANIC BILLS',
      home: StudentDashboard(),
    );
  }
}

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    List<Invoice> invoices = [
      Invoice(
        name: 'DSP',
        paid: 1000000,
        total: 3000000,
      ),
      Invoice(
        name: 'Prakerin',
        paid: 1000000,
        total: 3000000,
      ),
      Invoice(
        name: 'Seragam',
        paid: 1000000,
        total: 3000000,
      ),
    ];

    String profPicUrl = storage.read('profile_picture');

    Widget profPic;

    if (storage.read('profile_picture') == null) {
      profPic = Icons.person as Widget;
    } else {
      profPic = Image(image: CachedNetworkImageProvider(profPicUrl));
    }

    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            // backgroundColor: const Color.fromARGB(255, 160, 113, 242),
            title: Row(children: [
              Image.asset(
                'assets/images/skanic.png',
                scale: sy(6),
              ),
              SizedBox(width: sx(5)),
              Text(
                'BILLS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: sx(25),
                  letterSpacing: 0.75,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ]),
            automaticallyImplyLeading: false,
            actions: [
              PopupMenuButton(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                icon: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    shape: BoxShape.rectangle,
                  ),
                  height: sy(18),
                  width: sy(18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: profPic,
                  ),
                ),
                itemBuilder: ((context) => [
                      PopupMenuItem(
                        value: 1,
                        height: sy(10),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: sx(10)),
                                child: Icon(
                                  Icons.logout,
                                  size: sx(20),
                                  color: Colors.black,
                                )),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: sx(12),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          storage.erase().then((value) => Util().getStatus());
                        },
                      )
                    ]),
                offset: const Offset(0, 50),
                color: Colors.white,
                // color: const Color.fromARGB(255, 160, 113, 242),
                elevation: 2,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              height: height,
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
              child: SizedBox(
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      height: 200,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width,
                            height: 200,
                            child: const Image(
                              image: CachedNetworkImageProvider('https://smkn1ciomas.sch.id/gambar/7.jpg'),
                              fit: BoxFit.cover,
                            ),
                            // child: const FlutterLogo(size: 295),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(0),
                            ),
                            border: Border.all(
                              color: const Color.fromARGB(255, 98, 11, 239),
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0c000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: const Color.fromARGB(255, 98, 11, 239),
                          ),
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: sx(30),
                                height: sx(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                margin: const EdgeInsets.only(right: 6),
                                child: Icon(
                                  const IconData(
                                    0xe50d,
                                    fontFamily: 'MaterialIcons',
                                  ),
                                  color: Colors.white,
                                  size: sx(20),
                                ),
                              ),
                              SizedBox(
                                height: sx(30),
                                child: Text(
                                  "Tagihan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 252, 252, 252),
                                    fontSize: sx(15),
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: invoices.map((invoice) {
                        return box(invoice.name, Colors.white, invoice.paid, invoice.total);
                      }).toList(),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 5),
                          width: width,
                          child: Text(
                            "Riwayat",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 20, 19, 42),
                              fontSize: 24,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              width: width - 100,
                              height: 40,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width - 100,
                                    decoration: BoxDecoration(boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(100, 0, 0, 0),
                                        blurRadius: 5.0,
                                        offset: Offset(0, 0),
                                      ),
                                    ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Cari',
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: sx(20),
                                          fontFamily: GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(border: InputBorder.none),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                  IconData(
                                    0xf068,
                                    fontFamily: 'MaterialIcons',
                                  ),
                                  size: 50),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget box(String title, Color backgroundcolor, int paid, int total) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Util().redirectTo(title),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: width / 3.4 - 8,
                    width: width / 3.4 - 8,
                    decoration: BoxDecoration(
                      color: backgroundcolor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5.0, 10.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: CircularPercentIndicator(
                      radius: sx(50),
                      lineWidth: sx(10),
                      animation: true,
                      percent: paid / total,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${(paid / total * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sx(11),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            '${Util().numFormat(paid)}\ndari\n${Util().numFormat(total)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 110, 113, 145),
                              fontSize: sx(7),
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: const Color.fromARGB(255, 239, 240, 246),
                      progressColor: const Color.fromARGB(255, 98, 11, 239),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: width / 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
