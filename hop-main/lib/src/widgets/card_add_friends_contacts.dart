import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/friends/add_amigos_contacts.dart';
import 'package:hopapp/src/pages/friends/friends_bloc.dart';
import 'package:provider/provider.dart';

class CardAddContacts extends StatefulWidget {
  final nombre;
  final user;
  final urlFoto;
  final tipoIcon;
  final id;
  const CardAddContacts(
      {Key? key,
      required this.nombre,
      required this.user,
      required this.urlFoto,
      required this.tipoIcon,
      this.id})
      : super(key: key);

  @override
  _CardAddContactsState createState() => _CardAddContactsState();
}

class _CardAddContactsState extends State<CardAddContacts> {
  bool clickRemove = true;
  late FriendsBloc appFriends;
  @override
  Widget build(BuildContext context) {
    appFriends = context.watch<FriendsBloc>();

    return GestureDetector(
      onTap: () {
        print("estoy dando click ");
        setState(() {
          clickRemove = true;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: []),
        // height: 60,
        width: double.infinity,
        child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(widget.urlFoto),
            ),
            title: Text(
              widget.nombre,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
            subtitle: Text(widget.user),
            trailing: tipoIcono()),
      ),
    );
  }

  Widget invite() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: []),
      child: Text(
        'INVITE',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget request() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: []),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Color(0XFF206CFF),
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Accept',
                style: TextStyle(
                    color: Color(0XFF206CFF), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.close,
          color: Color(0xff565656),
          size: 20,
        ),
      ],
    );
  }

  Widget add() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            appFriends.agregarAmigo(widget.id);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: []),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: Color(0XFF2046CFF),
                  size: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Add',
                  style: TextStyle(
                      color: Color(0XFF206CFF), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'X',
          style: TextStyle(
              color: Color(0xff565656),
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
      ],
    );
  }

  Widget friends() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!clickRemove) {
            appFriends.eliminarAmigo(widget.id);
          }
        },
        child: Container(
          width: 80,
          decoration: BoxDecoration(
              color: clickRemove ? Colors.white : Color(0XFFF85959),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: []),
          child: clickRemove
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      clickRemove = false;
                    });
                  },
                  child: Icon(
                    Icons.delete,
                    color: Color(0XFFF85959),
                    size: 24,
                  ),
                )
              : Center(
                  child: Text(
                    "Remove",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
        ),
      ),
    );
  }

  Widget tipoIcono() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.tipoIcon == TYPEPAGEFRIENDS.REQUEST) ...{request()},
        if (widget.tipoIcon == TYPEPAGEFRIENDS.ADD) ...{add()},
        if (widget.tipoIcon == TYPEPAGEFRIENDS.FRIENDS) ...{friends()},
        if (widget.tipoIcon == TYPEPAGEFRIENDS.CONTACT) ...{invite()}
      ],
    );
  }
}
