import 'package:flutter/material.dart';
import 'package:hopapp/src/models/generoModel.dart';
import 'package:hopapp/src/models/secundRegisterModel.dart';
import 'package:hopapp/src/parameterClass/firsRegisterModel.dart';
import 'package:hopapp/src/parameterClass/secundRegisterModel.dart';
import 'package:hopapp/src/provider/usuarioProvider.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Register2Page extends StatefulWidget {
  @override
  _Register2PageState createState() => _Register2PageState();
}

class _Register2PageState extends State<Register2Page> {
  TextEditingController _fechaNacController = new TextEditingController();
  SecundRegisterModel secundReg = new SecundRegisterModel();
  final formKeySecundRegister = GlobalKey<FormState>();
  UsuarioProvider usuarioProv = new UsuarioProvider();
  List<GeneroModel> data = [];
  String _fecha = '';
  bool? checkedValue = false;

  @override
  void initState() {
    super.initState();
    cargaGenero();
    WidgetsBinding.instance!.addPostFrameCallback((_) => {});
  }

  void cargaGenero() async {
    data = await usuarioProv.listaGeneros();
    setState(() {});
  }

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
              height: responsive.altoP(10.00),
            ),
            Text(
              "A few more questions...",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.00),
              textAlign: TextAlign.center,
            ),
            Form(
              key: formKeySecundRegister,
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: responsive.anchoP(15)),
                    _fechaNacCampo(context),
                    _createPhoneNumber(),
                    _genderField(),
                    SizedBox(height: responsive.altoP(2.5)),
                    _yearOldConfirm(),
                    SizedBox(
                      height: responsive.altoP(6.00),
                    ),
                    Text("Hop Terms & Conditions agreement"),
                    SizedBox(
                      height: responsive.altoP(2.00),
                    ),
                    _botonIngreso(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }

  Widget _fechaNacCampo(BuildContext context) {
    return TextFormField(
      controller: _fechaNacController,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Date of birth (mm/dd/yyyy)",
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      onSaved: (value) => secundReg.birthday = value,
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1800),
      lastDate: new DateTime.now(),
      locale: Locale('en', 'EN'),
    );

    //var now = new DateTime.now();

    if (picked != null) {
      setState(() {
        var formatter = new DateFormat("yyyy-MM-dd");
        var inputDate =
            formatter.parse(picked.toString().trim().substring(0, 10));

        var outputFormat = DateFormat('MM/dd/yyyy');
        var outputDate = outputFormat.format(inputDate);
        _fecha = outputDate.toString();
        print(outputDate);

        _fechaNacController.text = _fecha.trim().substring(0, 10);
      });
    }
  }

  Widget _createPhoneNumber() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
      ),
      onSaved: (value) => secundReg.phone = value,
    );
  }

  Widget _genderField() {
    return DropdownButtonFormField(
      elevation: 2,
      items: usuarioProv.lwDdmItemsPreg(data),
      decoration: InputDecoration(labelText: "Gender"),
      onSaved: (dynamic value) => secundReg.gender = value,
      onChanged: (dynamic value) => {setState(() {})},
    );
  }

  Widget _yearOldConfirm() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: checkedValue! ? Colors.grey[900]! : Colors.grey[400]!,
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          width: 32,
          height: 30,
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.transparent,
            ),
            child: Checkbox(
              activeColor: Colors.transparent,
              checkColor: Colors.black,
              value: checkedValue,
              tristate: false,
              onChanged: (bool? isChecked) {
                setState(() {
                  checkedValue = isChecked;
                });
              },
            ),
          ),
        ),
        Text(
          "  I verify I´m over 21 years of age.",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _botonIngreso() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          _nextStep();
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
            child: Text("Continue",
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

  _nextStep() async {
    final FirstRegister? args =
        ModalRoute.of(context)!.settings.arguments as FirstRegister?;
    formKeySecundRegister.currentState!.save();
    if (checkedValue == false) {
      utils.alertValidation(context, AlertType.warning, "HOP",
          "You must be a person over 21 years old.");
      return;
    }

    if (secundReg.birthday!.isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Enter your birthday.");
      return;
    }

    if (secundReg.phone!.isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "Enter your phone number.");
      return;
    }

    if (!utils.telefonoValido(secundReg.phone!)) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "your phone number is invalid.");
      return;
    }

    if (secundReg.gender!.isEmpty) {
      utils.alertValidation(
          context, AlertType.warning, "HOP", "your gender is invalid");
      return;
    }

    Map<String, dynamic>? info = await usuarioProv.grabarUsuario(SecundRegister(
        args!.fullname,
        args.email,
        args.user,
        args.password,
        secundReg.birthday,
        secundReg.phone,
        secundReg.gender));

    if (int.parse(info!["id"].toString()) > 0) {
      utils.alertValidationRoute(
          context,
          AlertType.success,
          "HOP",
          "Congratulations " +
              info["nombre"].toString() +
              ", your user has been successfully registered, we must continue with other configurations",
          "permisos");
    } else {
      utils.alertValidation(context, AlertType.success, "HOP",
          "An error has occurred, verify the information entered");
    }
  }
}
