import 'package:flutter/material.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;

import 'share_prefs/preferencias_usuario.dart';

final _prefs = new PreferenciasUsuario();

class Profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
        SingleChildScrollView(child: formProfile())
      ],
    )));
  }

  Widget formProfile() {
    final responsive = ResponsiveUtil(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        utils.headerPantalla(context, "", Colors.black, "Home"),
        SizedBox(
          height: responsive.altoP(0.50),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 12, color: Colors.grey, spreadRadius: 5)
              ],
            ),
            child: CircleAvatar(
              radius: 55.0,
              backgroundImage: NetworkImage(
                _prefs.url.toString(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: responsive.altoP(3),
        ),
        Center(
          child: Text(
            nombreUser(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.00,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: responsive.altoP(3),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            children: [
              _opcionPersonalDetail(),
              _opcionTermCondition(),
              _opcionLogout()
            ],
          ),
        ),
        SizedBox(
          height: responsive.altoP(15),
        ),
        Center(
          child: Text(
            "Desactivate account",
            style: TextStyle(
                color: Colors.red,
                fontSize: 16.00,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  String nombreUser() {
    final _prefs = new PreferenciasUsuario();
    return _prefs.nombre.toString();
  }

  Widget _opcionPersonalDetail() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.person,
              size: 50,
              color: Colors.blue,
            ),
            onTap: () => {Navigator.pushNamed(context, "Profile")},
            title: Text('Personal Details'),
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _opcionTermCondition() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.assignment,
              size: 50,
              color: Colors.blue,
            ),
            title: Text('Terms and Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _opcionLogout() {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.save_alt,
                size: 50,
                color: Colors.blue,
              ),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, "login");
      },
    );
  }
}
