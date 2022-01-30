import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  PreferenciasUsuario._internal();

  String get id {
    return _prefs.getString('id') ?? '';
  }

  set id(String value) {
    _prefs.setString('id', value);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  String get email {
    return _prefs.getString('email') ?? '';
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  bool get ghost {
    return _prefs.getBool('ghost') ?? true;
  }

  set ghost(bool value) {
    _prefs.setBool('ghost', value);
  }

  set url(String value) {
    _prefs.setString('url', value);
  }

  String get url {
    return _prefs.getString('url') ?? '';
  }

  set celular(String value) {
    _prefs.setString('celular', value);
  }

  String get celular {
    return _prefs.getString('celular') ?? '';
  }
}
