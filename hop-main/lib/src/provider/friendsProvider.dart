import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/models/Friends.dart';
import 'package:hopapp/src/models/RequestFriends.dart';
import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';
import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';

class FriendsProvider {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();
  final _prefs = new PreferenciasUsuario();

  Future<List<Friends>> getFriends() async {
    QueryMutation _graph = QueryMutation();
    List<Friends> friends = [];
    final variable = {
      "input": {"id": _prefs.id}
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.getFriends()), variables: variable),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    for (var res in parsedJson["getFriends"]) {
      friends.add(Friends.fromMap(res));
    }
    return friends;
  }

  Future<List<RequestFriends>> getRequest() async {
    QueryMutation _graph = QueryMutation();
    List<RequestFriends> request = [];
    final variable = {
      "input": {"id": _prefs.id}
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.getRequest()), variables: variable),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));
    for (var res in parsedJson["solicitud"]) {
      request.add(RequestFriends.fromMap(res));
    }
    return request;
  }

  Future<dynamic> getAllUser() async {
    QueryMutation _graph = QueryMutation();
    // List<RequestFriends> request = [];

    final variable = {
      "input": {"ini": "0", "fin": "2"}
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.getAlluser()), variables: variable),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    print("------------------------------>");

    print(parsedJson);

    /* for (var res in parsedJson["solicitud"]) {
      request.add(RequestFriends.fromMap(res));
    } */
    return "request";
  }

  Future<Map<String, dynamic>?> inviteFriend(String idFriend) async {
    QueryMutation _graph = QueryMutation();
    final variable = {
      "input": {"idamigo": int.parse(idFriend), "idusr": int.parse(_prefs.id)}
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(
          document: gql(_graph.inviteFriend()), variables: variable),
    );
    var parsedJson = json.decode(jsonEncode(queryResult.data));
    return parsedJson;
  }

  Future<Map<String, dynamic>?> deleteFriend(String idFriend) async {
    QueryMutation _graph = QueryMutation();
    final variable = {
      "input": {"idamigo": int.parse(idFriend), "idusr": int.parse(_prefs.id)}
    };

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.deleteAmigo(_prefs.id, idFriend))),
    );
    var parsedJson = json.decode(jsonEncode(queryResult.data));
    return parsedJson;
  }
}
