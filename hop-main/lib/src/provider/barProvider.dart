import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/models/barfavoritoModel.dart';
import 'package:hopapp/src/models/friendsInBarModel.dart';
import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';
import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';

class BarProviders {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>?> infoBarData(String id) async {
    QueryMutation _graph = QueryMutation();

    final variable = {
      "input": {"id": int.parse(id)}
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.getInfoBar()), variables: variable),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    return parsedJson;
  }

  /*Future<Map<String, dynamic>> friendsInBar(
      String latitud, String longitud) async {
    QueryMutation _graph = QueryMutation();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(
          document:
              gql(_graph.friendsInBar(latitud, longitud, "48" /*_prefs.id*/))),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    return parsedJson;
  }*/

  Future<Map<String, dynamic>?> meGustaBar(String idbar) async {
    QueryMutation _graph = QueryMutation();

    final variable = {
      "input": {"idest": int.parse(idbar), "iduser": int.parse(_prefs.id)}
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.likeBar()), variables: variable),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));
    return parsedJson;
  }

  Future<List<BarFavorite>> listMegusta() async {
    QueryMutation _graph = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(
          document: gql(_graph.baresFavoritos(_prefs.id.toString()))),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));
    print(parsedJson["barfavorito"]);

    List<BarFavorite> lstBarFav = [];

    for (var Regs in parsedJson["barfavorito"]) {
      lstBarFav.add(BarFavorite.fromJson(Regs));
    }
    print(lstBarFav);
    return lstBarFav;
  }

  Future<List<FriendsInBarModel>> listFriendsBar(
      String? latitud, String? longitud) async {
    QueryMutation _graph = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(
          document:
              gql(_graph.friendsInBar(latitud, longitud, "48" /*_prefs.id*/))),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    List<FriendsInBarModel> listFriends = [];

    for (var Regs in parsedJson["geoamigosbar"]) {
      listFriends.add(FriendsInBarModel.fromJson(Regs));
    }
    print(listFriends);
    return listFriends;
  }

  Future<Map<String, dynamic>?> cobroBar(
      int idest, String desc, double precio) async {
    QueryMutation _graph = QueryMutation();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.pagoStripe(idest, desc, precio))),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));
    return parsedJson;
  }

  Future<Map<String, dynamic>?> infoVIP(String id) async {
    QueryMutation _graph = QueryMutation();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.informationVIPBar(id))),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));
    return parsedJson;
  }
}
