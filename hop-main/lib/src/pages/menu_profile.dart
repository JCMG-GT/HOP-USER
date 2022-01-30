import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/provider/usuarioProvider.dart';
import 'package:hopapp/src/utils/responsive.dart';
import 'package:hopapp/src/utils/utils.dart' as utils;
import 'share_prefs/preferencias_usuario.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

final txtName = TextEditingController();
final txtEmail = TextEditingController();
final txtTel = TextEditingController();
final _prefs = new PreferenciasUsuario();

// Strign uploadImage = r"""
// mutation($file: Upload!) {
//   updateAvatar(file: $file){
//     urlAvatar
//   }
// }
// """;

UsuarioProvider usrProv = new UsuarioProvider();

class MenuProfile extends StatefulWidget {
  @override
  _MenuProfilePageState createState() => _MenuProfilePageState();
}

class _MenuProfilePageState extends State<MenuProfile> {
  File? _image;
  bool _uploadInProgress = false;

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
        utils.headerPantalla(context, "", Colors.black, ""),
        SizedBox(
          height: responsive.altoP(0.50),
        ),
        Container(
          padding: EdgeInsets.only(left: 28.00),
          child: Text(
            "Edit Details",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 30.00,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: responsive.altoP(4),
        ),
        Center(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(blurRadius: 25, color: Colors.grey, spreadRadius: 5)
            ],
          ),
          child: _avatar(),
        )),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 35.0),
          child: _formEditDetails(),
        )
      ],
    );
  }

  Widget _avatar() {
    print(_prefs.url.toString());
    return CircularProfileAvatar(
      _prefs.url.toString(),
      radius: 75,
      backgroundColor: Colors.transparent,
      borderWidth: 1,
      initialsText: Text(
        "AD",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      placeHolder: (context, url) => Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
      borderColor: Color.fromARGB(255, 31, 108, 255),
      elevation: 5.0,
      foregroundColor: Colors.blue.withOpacity(0.2),
      cacheImage: false,
      onTap: () {
        selectImage();
        // getImage();
      }, // sets on tap
      showInitialTextAbovePicture: true,
    );
  }

  Widget _formEditDetails() {
    final responsive = ResponsiveUtil(context);
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
              height: responsive.altoP(3.00),
            ),
            _buttonUpdate(),
          ],
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: _prefs.nombre.toString(),
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
      initialValue: _prefs.email.toString(),
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
      initialValue: _prefs.celular.toString(),
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

  Widget _buttonUpdate() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          if (_image != null) {
            // _uploadIma+ge(context);
          }
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
            child: Text("Update",
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

  // _uploadImage(BuildContext context) async {
  //   setState(() {
  //     _uploadInProgress = true;
  //   });
  //   var byteData = _image!.readAsBytesSync();
  //   var multipartFile = MultipartFile.fromBytes(
  //     'photo',
  //     byteData,
  //     filename: '${DateTime.now().second}.jpg',
  //     contentType: MediaType("image", "jpg"),
  //   );
  //   var opts = MutationOptions(
  //     document: uploadImage,
  //     variables: {
  //       "file": multipartFile,
  //     },
  //   );
  //   var client = GraphQLProvider.of(context).value;
  //   var queryResult = await client.mutate(opts);

  //   var parsedJson = json.decode(jsonEncode(queryResult.data));
  //   print(parsedJson);
  //   Map<String, dynamic> decodeResp = parsedJson;

  //   _prefs.url = decodeResp["updateAvatar"]['urlAvatar'].toString();
  //   print(decodeResp);
  //   print(decodeResp["updateAvatar"]['urlAvatar'].toString());
  //   setState(() {
  //     _uploadInProgress = false;
  //   });
  // }

  Future selectImage() async {
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // setState(() {
    //   _image = image;
    // });
  }
}
