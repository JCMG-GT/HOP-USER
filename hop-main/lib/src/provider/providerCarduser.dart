import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/services/cardUserModel.dart';
import 'package:hopapp/src/services/historyPayment.dart';

import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';
import 'dart:convert';

class CardUserProvider {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();

  Future<List<TarjetaUs>> cardUser(String id) async {
    QueryMutation _graph = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.tarjetaUsuaio(id))),
    );
    final Map<String, dynamic> decodedData =
        json.decode(jsonEncode(queryResult.data));

    List<TarjetaUs> list;

    var rest = decodedData["tarjetaUs"] as List;

    list = rest.map<TarjetaUs>((json) => TarjetaUs.fromJson(json)).toList();

    return list;
  }

  Future<List<HistCompra>> historialCompra(String id) async {
    QueryMutation _graph = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.historialCompra(id))),
    );
    final Map<String, dynamic> decodedData =
        json.decode(jsonEncode(queryResult.data));

    List<HistCompra> list;

    var rest = decodedData["histCompra"] as List;

    list = rest.map<HistCompra>((json) => HistCompra.fromJson(json)).toList();

    return list;
  }
}
