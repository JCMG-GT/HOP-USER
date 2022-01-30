import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hopapp/src/models/loginModel.dart';
import 'package:hopapp/src/provider/usuarioProvider.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKeyLogin = GlobalKey<FormState>();
  UsuarioProvider usrProv = new UsuarioProvider();
  final txtEmail = TextEditingController();
  final txtClave = TextEditingController();
  bool _obscureContrasena = true;
  LoginModel logModel = new LoginModel();

  final LocalAuthentication auth = LocalAuthentication();
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        alignment: Alignment(0.0, 0.0),
        margin: new EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: responsive.altoP(8.00),
            ),
            Text(
              "Welcome back",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: responsive.altoP(5)),
              textAlign: TextAlign.center,
            ),
            Text(
              "Use your credentials to sign in.",
              style: TextStyle(fontSize: responsive.altoP(2.3)),
              textAlign: TextAlign.left,
            ),
            Form(
              key: formKeyLogin,
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: responsive.anchoP(12)),
                    _crearEmail(),
                    SizedBox(height: responsive.anchoP(10)),
                    _crearContrasena(),
                    SizedBox(
                      height: responsive.altoP(4.00),
                    ),
                    Text("Forgot password?",
                        style: TextStyle(
                            fontSize: responsive.altoP(2.3),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: responsive.altoP(6.00),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/login/FACEID.PNG",
                        width: responsive.anchoP(15),
                        height: responsive.altoP(15),
                      ),
                      onTap: () => _faceAuth(),
                    ),
                    SizedBox(
                      height: responsive.altoP(6.00),
                    ),
                    _botonIngreso(),
                    SizedBox(
                      height: responsive.altoP(6.00),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }

  Widget _crearEmail() {
    return TextFormField(
      controller: txtEmail,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "User",
        hintText: "Username/email",
      ),
      onSaved: (value) => logModel.user = value,
    );
  }

  Widget _crearContrasena() {
    return TextFormField(
      controller: txtClave,
      obscureText: _obscureContrasena,
      textCapitalization: TextCapitalization.sentences,
      autofocus: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: IconButton(
          icon: Icon(
            _obscureContrasena ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _obscureContrasena = !_obscureContrasena;
            });
          },
        ),
      ),
      onSaved: (value) => logModel.password = value,
      validator: (value) {
        if (value!.length == 0) {
          return "Es necesaria la contraseña";
        } else {
          return null;
        }
      },
    );
  }

  Widget _botonIngreso() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, "home");
          return;
          _login();
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
            child: Text("Login",
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

  _faceAuth() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        var localAuth = LocalAuthentication();
        bool didAuthenticate = await localAuth.authenticate(
            localizedReason: 'Please authenticate to show account balance',
            biometricOnly: true);

        print(didAuthenticate);
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        utils.alertValidation(context, AlertType.warning, "HOP", "Finger");
      }
    }
  }

  _login() async {
    if (txtEmail.text.isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Enter your username.");

      return;
    }
    if (txtClave.text.isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Enter your password.");
      return;
    }

    formKeyLogin.currentState!.save();
    utils.ProgressDialog progressDialog = utils.ProgressDialog(context);
    progressDialog.show();
    print("user" + logModel.user!);
    print("pass" + logModel.password!);

    Map info = await usrProv.login(logModel.user, logModel.password!);

    print("id " + info["login"]["id"]);
    print("nombre " + info["login"]["nombre"]);
    print("email " + info["login"]["email"]);

    int idUser = int.parse(info["login"]["id"].toString());
    progressDialog.dismiss();

    if (idUser > 0) {
      Navigator.pushNamed(context, "home");
    } else {
      utils.alertValidation(context, AlertType.warning, "HOP",
          "The email or password you entered is incorrect. Please try again .");
    }
  }
}
