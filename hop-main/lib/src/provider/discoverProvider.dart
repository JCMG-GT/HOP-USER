import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/services/classJson.dart';

import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';
import 'dart:convert';

class DiscoverProvider {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();

  Future<List<GetPromocion>> cargarPromociones() async {
    QueryMutation _graph = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.promoEstable())),
    );
    final Map<String, dynamic> decodedData =
        json.decode(jsonEncode(queryResult.data));

    List<GetPromocion> list;

    var rest = decodedData["getPromocion"] as List;

    list =
        rest.map<GetPromocion>((json) => GetPromocion.fromJson(json)).toList();

    return list;
  }

  Future<List<BarFavorito>> cargaBarFavorito() async {
    QueryMutation _graph = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.barFavorito())),
    );
    final Map<String, dynamic> decodedData =
        json.decode(jsonEncode(queryResult.data));
    List<BarFavorito> list;
    var rest = decodedData["barfavorito"] as List;
    list = rest.map<BarFavorito>((json) => BarFavorito.fromJson(json)).toList();
    return list;
  }
}
