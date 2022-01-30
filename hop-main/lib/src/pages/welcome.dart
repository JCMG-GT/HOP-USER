import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: responsive.altoP(5.00),
            ),
            Text(
              "Hop",
              style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              'assets/login/line.svg',
            ),
            Text(
              "Nightlife",
              style: GoogleFonts.poppins(
                  color: Color.fromRGBO(31, 108, 255, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: responsive.altoP(1.00),
            ),
            SizedBox(
              height: responsive.altoP(2.00),
            ),
            SvgPicture.asset(
              'assets/login/hop.svg',
            ),
            SizedBox(
              height: responsive.altoP(10.00),
            ),
            Center(child: _botonIngreso()),
            SizedBox(
              height: responsive.altoP(2.00),
            ),
            GestureDetector(
              child: Center(
                child: Text(
                  "Already have an account?",
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(46, 46, 46, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
            ),
            SizedBox(
              height: responsive.altoP(2.00),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _botonIngreso() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, "1Register");
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
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
            child: Text("Sign Up",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
