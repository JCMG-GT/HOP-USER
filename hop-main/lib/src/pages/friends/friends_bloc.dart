import 'package:flutter/material.dart';
import 'package:hopapp/src/models/Friends.dart';
import 'package:hopapp/src/models/RequestFriends.dart';
import 'package:hopapp/src/provider/friendsProvider.dart';

class FriendsBloc with ChangeNotifier {
  List<Friends> misAmigos = [];
  List<RequestFriends> requestFriends = [];

  FriendsProvider friendProv = new FriendsProvider();

  load() async {
    obtenerFriends();
    obtenerRequest();
    obtenerAllUser();
  }

  obtenerFriends() async {
    misAmigos = await friendProv.getFriends();
    notifyListeners();
  }

  obtenerRequest() async {
    requestFriends = await friendProv.getRequest();
    notifyListeners();
  }

  obtenerAllUser() async {
    var x = await friendProv.getAllUser();
    notifyListeners();
  }

  agregarAmigo(idFriend) {
    print(idFriend);

    //  load();
  }

  eliminarAmigo(idFriend) async {
    print("mi amigo id ");
    print(idFriend);
    var x = await friendProv.deleteFriend(idFriend.toString());
    print(x);
    //  load();
  }
}
