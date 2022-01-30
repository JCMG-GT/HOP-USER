class HitoryPayment {
  Data? data;

  HitoryPayment({this.data});

  HitoryPayment.fromJson(Map<String, dynamic> json) {
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
  List<HistCompra>? histCompra;

  Data({this.histCompra});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['histCompra'] != null) {
      histCompra = <HistCompra>[];
      json['histCompra'].forEach((v) {
        histCompra!.add(new HistCompra.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.histCompra != null) {
      data['histCompra'] = this.histCompra!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistCompra {
  String? compra;
  String? nombre;
  String? precio;

  HistCompra({this.compra, this.nombre, this.precio});

  HistCompra.fromJson(Map<String, dynamic> json) {
    compra = json['compra'];
    nombre = json['nombre'];
    precio = json['precio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compra'] = this.compra;
    data['nombre'] = this.nombre;
    data['precio'] = this.precio;
    return data;
  }
}
