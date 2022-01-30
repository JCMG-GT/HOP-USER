import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/widgets/botoncongradiente.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

bool esNumero(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

bool dpiValido(String s) {
  if (s.isEmpty) return false;

  if (s.length < 13 || s.length > 13) return false;

  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

bool correoValido(String s) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(pattern as String);

  if (regExp.hasMatch(s)) {
    return true;
  } else {
    return false;
  }
}

bool isPasswordValid(String password, [int minLength = 6]) {
  if (password.isEmpty) {
    return false;
  }
  bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length > minLength;
  return hasDigits &
      hasUppercase &
      hasLowercase &
      hasSpecialCharacters &
      hasMinLength;
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern as String);
  return (!regex.hasMatch(value)) ? false : true;
}

bool validateCreditCard(String value) {
  Pattern pattern =
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$';

  RegExp regex = new RegExp(pattern as String);
  return (!regex.hasMatch(value)) ? false : true;
}

bool telefonoValido(String s) {
  if (s.isEmpty) return false;

  if (s.length < 8 || s.length > 8) return false;

  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

void mostrarAlerta(
    BuildContext context,
    String titulo,
    double tituloTam,
    Color tituloColor,
    FontWeight tituloWeight,
    String mensaje,
    double mensajeTam,
    Color mensajeColor,
    FontWeight mensajeWeight,
    String imagen,
    String width,
    String height,
    String botonMensaje) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Text(titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: tituloTam,
                  color: tituloColor,
                  fontWeight: tituloWeight)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  mensaje,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: mensajeTam,
                      color: mensajeColor,
                      fontWeight: mensajeWeight),
                ),
                /*Image.asset(
                  imagen,
                  width: double.parse(width),
                  height: double.parse(height),
                )*/
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(botonMensaje))
          ],
        );
      });
}

void mostrarAlertaRuta(
    BuildContext context,
    String titulo,
    String mensaje,
    String imagen,
    String width,
    String height,
    String botonMensaje,
    String ruta) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo, textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(mensaje, textAlign: TextAlign.center),
                Image.asset(
                  imagen,
                  width: double.parse(width),
                  height: double.parse(height),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => {
                      Navigator.pushReplacementNamed(context, ruta),
                    },
                child: Text(botonMensaje))
          ],
        );
      });
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

Widget headerPantalla(
    BuildContext context, String titulo, Color color, String ruta) {
  final responsive = ResponsiveUtil(context);
  return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      alignment: Alignment.centerLeft,
      height: responsive.altoP(10.00),
      child: Row(
        children: [
          SizedBox(
            width: responsive.anchoP(3.50),
          ),
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ruta);
            },
          ),
          Expanded(
              child: Center(
            child: Text(titulo,
                style: TextStyle(
                    fontSize: 19.00,
                    color: Color.fromRGBO(8, 63, 163, 1),
                    fontWeight: FontWeight.bold)),
          ))
        ],
      ));
}

Widget headerFinalPantalla(
    BuildContext context, String titulo, Color color, String ruta) {
  final responsive = ResponsiveUtil(context);
  return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      alignment: Alignment.centerLeft,
      height: responsive.altoP(10.00),
      child: Row(
        children: [
          Expanded(child: Container()),
          GestureDetector(
            child: Icon(
              Icons.clear,
              size: 35,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushNamed(context, ruta);
            },
          ),
          SizedBox(
            width: responsive.anchoP(5.00),
          )
        ],
      ));
}

void alertValidation(BuildContext context, AlertType tipoAlerta,
    String titleString, String descriptionString) {
  Alert(
    closeIcon: Container(),
    context: context,
    title: titleString,
    desc: descriptionString,
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 86, 39, 158),
          Color.fromARGB(255, 31, 108, 255),
          Color.fromARGB(255, 31, 108, 255)
        ]),
        width: 120,
      )
    ],
  ).show();
}

void alertValidationRoute(BuildContext context, AlertType tipoAlerta,
    String titleString, String descriptionString, String ruta) {
  Alert(
    context: context,
    type: tipoAlerta,
    title: titleString,
    desc: descriptionString,
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => {Navigator.popAndPushNamed(context, ruta)},
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 86, 39, 158),
          Color.fromARGB(255, 31, 108, 255),
          Color.fromARGB(255, 31, 108, 255)
        ]),
        width: 120,
      )
    ],
  ).show();
}

String payString(double amount) {
  return '${(amount * 100).floor()}';
}

void showDialogos(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15.0),
              width: MediaQuery.of(context).size.width,
              // height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text("Ghost Mode",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.none,
                            color: Colors.black))),
                SizedBox(
                  height: 20.0,
                ),
                Text("You are now invisible for the next 24 hours.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none,
                            color: Colors.black))),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: RaisedGradientButton(
                      child: Text('Continue',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Colors.white))),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xff5329ac),
                          Color(0xff3158df),
                          AppColors.primary
                        ],
                      ),
                      onPressed: () {
                        print('button clicked');
                        Navigator.pop(context);
                      }),
                ),
              ])),
        ),
      );
    },
  );
}

void showAlert({
  required BuildContext context,
  required String title,
  required String description,
  AlertType? tipoAlerta,
}) {
  Alert(
    type: tipoAlerta,
    closeIcon: Container(),
    context: context,
    title: title,
    style: AlertStyle(
      titleStyle: TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontFamily: "Poppins",
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      descStyle: TextStyle(
          fontSize: 18,
          fontFamily: "Poppins",
          color: Colors.black,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.normal),
    ),
    desc: description,
    content: Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: CustomButton(
          onPressed: () => Navigator.pop(context),
          title: 'Confirm',
          gradient: false,
          colorPrimary: AppColors.primary),
    ),
    buttons: [],
  ).show();
}

void showDialogConfirm(
    context, String title, String body, Function onPressedOK) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10.0),
            width: MediaQuery.of(context).size.width,
            // height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text(
                "$title",
                style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.none,
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "$body",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins",
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButton(
                  onPressed: onPressedOK,
                  title: 'Confirm',
                  gradient: false,
                  colorPrimary: AppColors.primary),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
            ])),
      );
    },
  );
}

class ProgressDialog {
  final BuildContext? context;
  ProgressDialog(this.context);

  void show() {
    showCupertinoModalPopup(
      context: this.context!,
      builder: (_) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.7),
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context!);
  }
}
