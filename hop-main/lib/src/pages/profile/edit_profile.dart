import 'package:flutter/material.dart';
import 'package:hopapp/src/config/app_colors.dart';

import 'package:hopapp/src/pages/profile/widgets/widget_profile.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';

import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: responsive.anchoP(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                SizedBox(height: responsive.altoP(8)),
                BarTitle(
                  key: Key('Key_editprofile_page'),
                  nameBar: 'Edit Details',
                ),
                SizedBox(height: responsive.altoP(4)),
                Align(
                  alignment: Alignment.center,
                  child: UserImage(
                      urlImg:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRft9j1N5RomI96p0vldhtRrYqpXbyGuvBWQw&usqp=CAU'),
                ),
                SizedBox(height: responsive.altoP(3)),
                FormEditDetails(
                  responsive: responsive,
                ),
                SizedBox(height: responsive.altoP(3)),
              ],
            ),
          ),
          CustomCloseButton(responsive: responsive),
        ],
      ),
    ));
  }
}

class FormEditDetails extends StatelessWidget {
  const FormEditDetails({Key? key, required this.responsive}) : super(key: key);

  final ResponsiveUtil responsive;
  @override
  Widget build(BuildContext context) {
    return Form(
      //key: formKeyLogin,
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: responsive.altoP(3)),
            _createName(),
            SizedBox(height: responsive.altoP(3)),
            _createEmail(),
            SizedBox(height: responsive.altoP(3)),
            _createPhone(),
            SizedBox(height: responsive.altoP(3)),
            SizedBox(
              height: responsive.altoP(5.00),
            ),
            CustomButton(
              onPressed: () {},
              title: 'Update',
              gradient: false,
              colorPrimary: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      // initialValue: _prefs.nombre.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: '',
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
          labelText: 'Name',
          labelStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17.00),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none),
      onSaved: (value) => null, //login.usuario = value,
      validator: (value) {
        if (value!.length == 0) {
          return "Es necesario el usuario";
        } else {
          return null;
        }
      },
    );
  }

  Widget _createEmail() {
    return TextFormField(
      // initialValue: _prefs.email.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: '',
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
          labelText: 'Email',
          labelStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17.00),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none),
      onSaved: (value) => null, //login.usuario = value,
      validator: (value) {
        if (value!.length == 0) {
          return "Es necesario el usuario";
        } else {
          return null;
        }
      },
    );
  }

  Widget _createPhone() {
    return TextFormField(
      // initialValue: _prefs.celular.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: '',
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
          labelText: 'Phone Number',
          labelStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17.00),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none),
      onSaved: (value) => null, //login.usuario = value,
      validator: (value) {
        if (value!.length == 0) {
          return "Es necesario el usuario";
        } else {
          return null;
        }
      },
    );
  }
}
