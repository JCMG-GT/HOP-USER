import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/logic/bloc/register/register_bloc_bloc.dart';
import 'package:hopapp/src/models/firstRegisterModel.dart';
import 'package:hopapp/src/pages/menu_profile.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';
import 'package:hopapp/src/parameterClass/firsRegisterModel.dart';
import 'package:hopapp/src/provider/usuarioProvider.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'package:rflutter_alert/rflutter_alert.dart';

class Register1Page extends StatefulWidget {
  @override
  _Register1PageState createState() => _Register1PageState();
}

FirstRegisterModel firsModel = new FirstRegisterModel();

class _Register1PageState extends State<Register1Page> {
  UsuarioProvider usuario = new UsuarioProvider();
  final formKeyFirstRegister = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.firstPageRegisterValidate) {
          Navigator.pushNamed(context, "2Register",
              arguments: FirstRegister(firsModel.fullname, firsModel.email,
                  firsModel.user, firsModel.password));
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment(0.0, 0.0),
              padding: new EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: responsive.altoP(3.0),
                  ),
                  InkWell(
                    // this is the one you are looking for..........
                    onTap: () {
                      Navigator.of(context).pop();
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
                        margin: EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsive.altoP(1.5),
                  ),
                  Text(
                    "Welcome",
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: formKeyFirstRegister,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: responsive.altoP(5)),
                          _createFullName(),
                          _createEmail(),
                          _createUserName(),
                          _createPassword(),
                          SizedBox(
                            height: responsive.altoP(6.00),
                          ),
                          CustomButton(
                            title: 'Continue',
                            onPressed: () {
                              formKeyFirstRegister.currentState!.save();
                              _nextPageRegister(firsModel);
                            },
                          ),
                          SizedBox(
                            height: responsive.altoP(4.00),
                          ),
                          GestureDetector(
                            child: Text("I already have an account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.00)),
                            onTap: () {
                              Navigator.pushNamed(context, "login");
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))),
    );
  }

  Widget _createFullName() {
    return TextFormField(
      controller: context.read<RegisterBloc>().txtFullName,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Enter full name",
        hintText: "Enter full name",
        labelStyle: TextStyle(color: AppColors.gris),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
      ),
      onSaved: (value) => firsModel.fullname = value,
    );
  }

  Widget _createEmail() {
    return TextFormField(
      controller: context.read<RegisterBloc>().txtEmail,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Email",
        labelStyle: TextStyle(color: AppColors.gris),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
      ),
      onSaved: (value) => firsModel.email = value,
    );
  }

  Widget _createUserName() {
    return TextFormField(
      controller: context.read<RegisterBloc>().txtUserName,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "User",
        hintText: "Enter Uaer",
        labelStyle: TextStyle(color: AppColors.gris),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
      ),
      onSaved: (value) => firsModel.user = value,
    );
  }

  Widget _createPassword() {
    return TextFormField(
      controller: context.read<RegisterBloc>().txtPassword,
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Create a password",
        helperText: '''
          At least eight characters
          Both uppercase and lowercase letters
          at least one number and one symbol (like! @ # \$)''',
        labelStyle: TextStyle(color: AppColors.gris),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gris.withOpacity(0.4)),
        ),
      ),
      onSaved: (value) => firsModel.password = value,
      onChanged: (value) {
        print(utils.isPasswordValid(value));
      },
    );
  }

  _nextPageRegister(FirstRegisterModel data) async {
    if (data.fullname.toString().isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Enter full name.");
      return;
    }
    if (data.email.toString().isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Enter your email.");
      return;
    }
    if (data.password.toString().isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Enter your password.");
      return;
    }

    if (utils.isPasswordValid(data.password.toString()) == false) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Password not valid.");
      return;
    }
    if (utils.validateEmail(data.email.toString()) == false) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Email not valid.");
      return;
    }

    Map<String, dynamic>? info =
        await usuario.validaCorreo(data.email.toString());
    int idUserem = int.parse(info!["validEmail"]["id"].toString());
    if (idUserem > 0) {
      utils.alertValidation(context, AlertType.warning, "HOP",
          "Sorry, that email address is already associated.");
      return;
    }

    Map<String, dynamic>? infoUs =
        await usuario.validaUsuario(data.user.toString());
    int idUser = int.parse(infoUs!["validUser"]["id"].toString());
    if (idUser > 0) {
      utils.alertValidation(context, AlertType.warning, "HOP",
          "Sorry, that user name is already associated.");
      return;
    }

    formKeyFirstRegister.currentState!.save();
    Navigator.pushNamed(context, "2Register",
        arguments: FirstRegister(firsModel.fullname, firsModel.email,
            firsModel.user, firsModel.password));
  }
}
