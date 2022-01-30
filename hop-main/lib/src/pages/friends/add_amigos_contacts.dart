import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/friends/friends_bloc.dart';
import 'package:hopapp/src/pages/home/tab_discover/widgets/widgets_tab_discover.dart';
import 'package:hopapp/src/widgets/card_add_friends_contacts.dart';
import 'package:provider/provider.dart';

enum TYPEPAGEFRIENDS { REQUEST, ADD, FRIENDS, CONTACT }

class AddAmigos extends StatefulWidget {
  AddAmigos._();

  static ChangeNotifierProvider init() => ChangeNotifierProvider<FriendsBloc>(
        create: (_) => FriendsBloc()..load(),
        builder: (_, __) => new AddAmigos._(),
      );

  @override
  _AddAmigosState createState() => _AddAmigosState();
}

class _AddAmigosState extends State<AddAmigos> {
  late FriendsBloc appHome;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appHome = context.watch<FriendsBloc>();

    final List<Widget> tabsItems = [
      Tab(icon: Text("Request")),
      Container(
        width: double.infinity,
        child: Tab(icon: Text("Friends")),
      ),
      Tab(icon: Text("Contacts")),
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
      length: 3,
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Text(
                      "Add Friends",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 28,
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
                      print("cambio tab");
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
              Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: page(appHome.requestFriends,
                          tipo: TYPEPAGEFRIENDS.REQUEST)),
                  Text(
                    "Quick Add",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: page(appHome.requestFriends,
                          tipo: TYPEPAGEFRIENDS.ADD)),
                ],
              ),
              page(appHome.misAmigos, tipo: TYPEPAGEFRIENDS.FRIENDS),
              page(appHome.misAmigos, tipo: TYPEPAGEFRIENDS.CONTACT),
            ],
          ),
        ),
      ),
    );
  }

  Widget page(var listado, {TYPEPAGEFRIENDS tipo = TYPEPAGEFRIENDS.REQUEST}) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listado.length,
      itemBuilder: (context, index) {
        return CardAddContacts(
          nombre: listado[index].nombre.toString(),
          user: listado[index].email.toString(),
          urlFoto: listado[index].url.toString(),
          tipoIcon: tipo,
          id: tipo == TYPEPAGEFRIENDS.FRIENDS
              ? listado[index].idAmig
              : listado[index].id == null
                  ? ""
                  : listado[index].id,
        );
      },
    );
  }
}
