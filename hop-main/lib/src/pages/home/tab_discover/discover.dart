import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/home/tab_discover/widgets/widgets_tab_discover.dart';
import 'package:hopapp/src/services/classJson.dart';
import 'package:hopapp/src/widgets/CardPromociones.dart';
import 'package:hopapp/src/provider/discoverProvider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hopapp/src/widgets/cardDiscoverFriends.dart';

DiscoverProvider discoverProv = new DiscoverProvider();
int tab = 0;

class Discover extends StatefulWidget {
  @override
  State<Discover> createState() => DiscoverState();
}

class DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> tabsItems = [
      Tab(icon: Text("Promotions")),
      Tab(icon: Text("Friends")),
    ];

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 30,
              right: 30,
            ),
            child: tabBar(tabsItems),
          ),
        ));
  }

  Widget tabBar(tabsItems) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 5),
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pushNamed(context, "home");
                        },
                      ),
                    ),
                    Text(
                      "Discover",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverAppBarDelegate(
                TabBar(
                    onTap: (numero) {
                      tab = numero;
                    },
                    indicatorColor: Colors.blue,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    tabs: tabsItems),
              ),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              page(),
              page2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget page() {
    print(tab);
    return FutureBuilder(
        future: discoverProv.cargarPromociones(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GetPromocion>> snapshot) {
          if (snapshot.hasData) {
            final promoCion = snapshot.data!;
            return ListView.builder(
              itemCount: promoCion.length,
              itemBuilder: (context, i) {
                return CardAddPromociones(
                  nombrebar: promoCion[i].nombre,
                  descripbar: promoCion[i].horario,
                  urlFotobar: promoCion[i].url,
                );
              },
            );
          } else {
            return Center(child: SpinKitFadingCube(color: Colors.indigo[700]));
          }
        });
  }

  Widget page2() {
    return FutureBuilder(
        future: discoverProv.cargaBarFavorito(),
        builder:
            (BuildContext context, AsyncSnapshot<List<BarFavorito>> snapshot) {
          if (snapshot.hasData) {
            final barFavorito = snapshot.data!;
            return ListView.builder(
              itemCount: barFavorito.length,
              itemBuilder: (context, i) {
                return CardDiscoverFriends(
                  nombrebar: barFavorito[i].nombre,
                  cantamigos: barFavorito[i].totalfriends,
                  urlFotobar: barFavorito[i].url,
                );
              },
            );
          } else {
            return Center(child: SpinKitFadingCube(color: Colors.indigo[700]));
          }
        });
  }
}
