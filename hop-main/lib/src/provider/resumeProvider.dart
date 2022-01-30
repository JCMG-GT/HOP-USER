import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/services/estableResumen.dart';

import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';
import 'dart:convert';

class ResumeProvider {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();

  Future<List<EstabletipProd>> cargarResumen(String id) async {
    QueryMutation _graph = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.estableResumen(id))),
    );
    final Map<String, dynamic> decodedData =
        json.decode(jsonEncode(queryResult.data));

    List<EstabletipProd> list;

    var rest = decodedData["establetipProd"] as List;

    list = rest
        .map<EstabletipProd>((json) => EstabletipProd.fromJson(json))
        .toList();

    return list;
  }
}
