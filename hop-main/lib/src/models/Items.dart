class Items {
  bool click = true;
  String? icono;
  final route;
  Items({
    this.icono,
    this.route,
  });

  bool get getClick => click;

  set setClick(bool click) => this.click = click;
}

List<Items> listaItems = [
  new Items(
      icono: "assets/menuOptions/configuration.png", route: "MenuProfile"),
  new Items(icono: "assets/menuOptions/card.png", route: "PaymentHistory"),
  new Items(icono: "assets/menuOptions/persons.png", route: "addamigos"),
  new Items(icono: "assets/menuOptions/ghost.png", route: "ghost")
];
