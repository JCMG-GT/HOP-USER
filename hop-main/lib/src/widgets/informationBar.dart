import 'package:flutter/material.dart';
import 'package:hopapp/src/models/friendsInBarModel.dart';
import 'package:hopapp/src/provider/barProvider.dart';
import 'package:hopapp/src/parameterClass/TransacModel.dart';
import 'package:hopapp/src/parameterClass/informationBarModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/utils/utils.dart';

Widget informationBarHop(
    BuildContext context,
    int idBar,
    String nombreBar,
    String urlImagen,
    String noAmigos,
    String hopLine,
    String cover,
    String table,
    String descuento,
    String? like,
    String? latitud,
    String? longitud) {
  BarProviders barProv = new BarProviders();
  return Container(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: tarjetaAmigos(idBar, nombreBar, urlImagen, noAmigos, like),
        ),
        SizedBox(
          height: 20,
        ),
        tablaPrecio(context, idBar, nombreBar, hopLine, cover, table),
        promocion(descuento),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Friends',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: FutureBuilder(
          future: barProv.listFriendsBar(latitud, longitud),
          builder: (BuildContext context,
              AsyncSnapshot<List<FriendsInBarModel>> snapshot) {
            if (snapshot.hasData) {
              final infoFriends = snapshot.data!;

              return infoFriends.length > 0
                  ? ListView.builder(
                      itemCount: infoFriends.length,
                      itemBuilder: (context, i) => cardAmigos(
                          infoFriends[i].nombre!, infoFriends[i].url),
                    )
                  : noFriends();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ],
    ),
  );
}

Widget informationBarGoogle(BuildContext context, int idBar, String nombreBar,
    String urlImagen, String noAmigos, String? latitud, String? longitud) {
  BarProviders barProv = new BarProviders();
  return Container(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: tarjetaAmigosGoogle(idBar, nombreBar, urlImagen, noAmigos),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Friends',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: FutureBuilder(
          future: barProv.listFriendsBar(latitud, longitud),
          builder: (BuildContext context,
              AsyncSnapshot<List<FriendsInBarModel>> snapshot) {
            if (snapshot.hasData) {
              final infoFriends = snapshot.data!;

              return infoFriends.length > 0
                  ? ListView.builder(
                      itemCount: infoFriends.length,
                      itemBuilder: (context, i) => cardAmigos(
                          infoFriends[i].nombre!, infoFriends[i].url),
                    )
                  : noFriends();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ],
    ),
  );
}

Widget noFriends() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 50,
      ),
      Text("Yo have no friends ... here",
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
      SizedBox(
        height: 10,
      ),
      Text("+ Add Friends",
          style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
    ],
  );
}

Widget tarjetaAmigos(int id, String nombreNegocio, String urlImagen,
    String amigos, String? like) {
  return Container(
    height: 80,
    margin: EdgeInsets.only(
      top: 10,
    ),
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(
        width: 0.8,
        color: Colors.grey[200]!,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: NetworkImage(urlImagen),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombreNegocio,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
              Text(amigos,
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    color: Colors.grey,
                  ))
            ],
          ),
        )),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: like == "1"
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 30,
                  ),
          ),
          onTap: () => {likeBar(id)},
        ),
      ],
    ),
  );
}

Widget tarjetaAmigosGoogle(
    int id, String nombreNegocio, String urlImagen, String amigos) {
  return Container(
    height: 80,
    margin: EdgeInsets.only(
      top: 10,
    ),
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(
        width: 0.8,
        color: Colors.grey[200]!,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: NetworkImage(urlImagen),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombreNegocio,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
              Text(amigos,
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    color: Colors.grey,
                  ))
            ],
          ),
        )),
      ],
    ),
  );
}

Widget tablaPrecio(BuildContext context, int idBar, String nombreNegocio,
    String hopLine, String cover, String table) {
  final tamanioLetra = 12.0;
  BarProviders barProv = new BarProviders();
  return Container(
    height: 120,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            width: 0.8,
            color: Colors.grey[200]!,
          )),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hop the Line",
                          style: TextStyle(
                            fontSize: tamanioLetra,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "\$" + hopLine,
                          style: TextStyle(
                            fontSize: tamanioLetra,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      makePay(context, idBar, "Hop the Line",
                          double.parse(hopLine));
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.8,
                        color: Colors.grey[200]!,
                      ),
                      right: BorderSide(
                        width: 0.8,
                        color: Colors.grey[200]!,
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Cover",
                          style: TextStyle(
                            fontSize: tamanioLetra,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '\$' + cover,
                          style: TextStyle(
                            fontSize: tamanioLetra,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      makePay(context, idBar, "Cover", double.parse(cover));
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "VIP",
                          style: TextStyle(
                            fontSize: tamanioLetra,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.none,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "InfoBar",
                        arguments: InfoBarArgModel(
                            idBar.toString(), nombreNegocio, "10.80"));
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
            width: 0.8,
            color: Colors.grey[200]!,
          )),
          width: double.infinity,
          child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Table",
                  style: TextStyle(
                    fontSize: tamanioLetra,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "\$" + table + " minimo",
                  style: TextStyle(
                    fontSize: tamanioLetra,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            onTap: () {
              makePay(context, idBar, "Table", double.parse(table));
            },
          ),
        ),
      ],
    ),
  );
}

Widget promocion(dynamic desc) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: []),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Text(
      desc,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        decoration: TextDecoration.none,
        color: Colors.black,
      ),
    ),
  );
}

Widget cardAmigos(String nombre, String? imagen) {
  return Container(
    child: ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(imagen.toString()),
      ),
      title: Text(
        nombre,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.none,
          color: Colors.black,
        ),
      ),
      onTap: () {
        print(nombre);
      },
    ),
  );
}

void likeBar(int idbar) async {
  BarProviders bar = new BarProviders();
  Map<String, dynamic>? info = await bar.meGustaBar(idbar.toString());
  print(info!["meGusta"]["megusta"]);
}

void makePay(BuildContext context, int idBar, String desc, double price) async {
  showDialogConfirm(context, "Confirm Payment",
      "Are you sure you want to make this payment of $price ", () async {
    Navigator.of(context).pop();
    BarProviders barProv = new BarProviders();
    ProgressDialog dialog = ProgressDialog(context);
    dialog.show();
    Map<String, dynamic>? info = await barProv.cobroBar(idBar, desc, price);
    dialog.dismiss();
    Navigator.pop(context);
    Navigator.pushNamed(context, "QRGenerator",
        arguments: TransacBar(
            int.parse(info!["usCompra"]["idtran"]), "Bar de Prueba"));
  });
}
