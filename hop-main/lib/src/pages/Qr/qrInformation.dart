import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopapp/src/utils/responsive.dart';

class QrInformation extends StatefulWidget {
  @override
  State<QrInformation> createState() => QrInformationState();
}

class QrInformationState extends State<QrInformation> {
  @override
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 30,
                right: 30,
              ),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: responsive.anchoP(8),
                    ),
                    Row(
                      children: [
                        InkWell(
                          // this is the one you are looking for..........
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: new Container(
                            width: 35.0,
                            height: 35.0,
                            //padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87.withOpacity(0.2),
                                  blurRadius: 1,
                                  offset: Offset(0.5, 0.5), // Shadow position
                                ),
                              ],
                            ),
                            child: Container(
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 25,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    SizedBox(height: responsive.altoP(5)),
                    Text(
                      "How Payment Works",
                      style: GoogleFonts.poppins(
                          color: Color.fromRGBO(31, 108, 255, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Walk up to the entrance and present your QR code. Someone will scan your QR code which automatically charges the payment method you’ve provided. You’re all set. Your QR code changes after each time you open the app. With faceID enabled, only you will have access to the QR code associated with your payment method.',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Prices are subject to change at every establishment’s discretion at any point in time, however, the current price will always be reflected in the app.',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The final payment will be comprised of the following: \n • The price of whatever you are buying \n • 10% of the subtotal with a minimum of 50 \n • 5% downpayment on table reservations",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Happy Hopping!',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: responsive.altoP(5),
                    ),
                    _botonClose(context)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

String generateRandom() {
  var valor = 0;
  return valor.toString();
}

Widget _botonClose(BuildContext context) {
  return Container(
    height: 50.0,
    child: RaisedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 86, 39, 158),
                Color.fromARGB(255, 31, 108, 255),
                Color.fromARGB(255, 31, 108, 255)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text("Close",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.00)),
        ),
      ),
    ),
  );
}
