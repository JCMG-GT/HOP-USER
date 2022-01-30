import "package:flutter/material.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

//Comentado codiog con anteriors versiones de la libreria revisar su configuracion

class GraphQLConfiguration {
  // static HttpLink httpLink = HttpLink(uri: 'http://18.219.32.199:4000');

  static HttpLink httpLink = HttpLink('http://18.219.32.199:4000');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),

      // cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
      // cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    );
  }
}
