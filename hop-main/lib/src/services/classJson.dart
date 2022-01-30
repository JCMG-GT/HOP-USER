class validemail {
  ValidEmail? _validEmail;

  validemail({ValidEmail? validEmail}) {
    this._validEmail = validEmail;
  }

  ValidEmail? get validEmail => _validEmail;
  set validEmail(ValidEmail? validEmail) => _validEmail = validEmail;

  validemail.fromJson(Map<String, dynamic> json) {
    _validEmail = json['validEmail'] != null
        ? new ValidEmail.fromJson(json['validEmail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._validEmail != null) {
      data['validEmail'] = this._validEmail!.toJson();
    }
    return data;
  }
}

class ValidEmail {
  String? _id;

  ValidEmail({String? id}) {
    this._id = id;
  }

  String? get id => _id;
  set id(String? id) => _id = id;

  ValidEmail.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    return data;
  }
}

class Promociones {
  Data? data;

  Promociones({this.data});

  Promociones.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<GetPromocion>? getPromocion;

  Data({this.getPromocion});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['getPromocion'] != null) {
      getPromocion = <GetPromocion>[];
      json['getPromocion'].forEach((v) {
        getPromocion!.add(new GetPromocion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getPromocion != null) {
      data['getPromocion'] = this.getPromocion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetPromocion {
  String? horario;
  String? idestable;
  String? nombre;
  String? url;

  GetPromocion({this.horario, this.idestable, this.nombre, this.url});

  GetPromocion.fromJson(Map<String, dynamic> json) {
    horario = json['horario'];
    idestable = json['idestable'];
    nombre = json['nombre'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['horario'] = this.horario;
    data['idestable'] = this.idestable;
    data['nombre'] = this.nombre;
    data['url'] = this.url;
    return data;
  }
}

class Estpromociones {
  String? horario;
  String? idestable;
  String? nombre;
  String? url;

  Estpromociones({this.horario, this.idestable, this.nombre, this.url});

  Estpromociones.fromJson(Map<String, dynamic> json) {
    horario = json['horario'];
    idestable = json['idestable'];
    nombre = json['nombre'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['horario'] = this.horario;
    data['idestable'] = this.idestable;
    data['nombre'] = this.nombre;
    data['url'] = this.url;
    return data;
  }
}

class BarFavorito {
  String? nombre;
  String? url;
  String? totalfriends;

  BarFavorito({this.nombre, this.url, this.totalfriends});

  BarFavorito.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    url = json['url'];
    totalfriends = json['totalfriends'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['url'] = this.url;
    data['totalfriends'] = this.totalfriends;
    return data;
  }
}
