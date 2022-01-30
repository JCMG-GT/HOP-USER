class EstableResumProd {
  Data? data;

  EstableResumProd({this.data});

  EstableResumProd.fromJson(Map<String, dynamic> json) {
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
  List<EstabletipProd>? establetipProd;

  Data({this.establetipProd});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['establetipProd'] != null) {
      establetipProd = <EstabletipProd>[];
      json['establetipProd'].forEach((v) {
        establetipProd!.add(new EstabletipProd.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.establetipProd != null) {
      data['establetipProd'] =
          this.establetipProd!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EstabletipProd {
  String? nombre;
  String? url;

  EstabletipProd({this.nombre, this.url});

  EstabletipProd.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['url'] = this.url;
    return data;
  }
}
