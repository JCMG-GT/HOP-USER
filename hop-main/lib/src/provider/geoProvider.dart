import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/models/geoLocationDataModel.dart';
import 'package:hopapp/src/models/location_person.dart';
import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';
import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';

class GeoProviders {
  final _prefs = new PreferenciasUsuario();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();

  Future<bool> grabarGeoPosicion(String latitud, String longitud) async {
    QueryMutation _graph = QueryMutation();

    final variable = {
      "input": {"idusr": _prefs.id, "lat": latitud, "long": longitud}
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    await _client.mutate(
      MutationOptions(document: gql(_graph.grabarGeo()), variables: variable),
    );

    return true;
  }

  Future<List<LocationPerson>> getAllLocation() async {
    QueryMutation grap = QueryMutation();
    List<LocationPerson> localizaciones = [];
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(grap.getAllLocation())),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    print(parsedJson);

    for (var res in parsedJson["getAllEstable"]) {
      localizaciones.add(LocationPerson.fromMap(res));
    }
    print("------");
    print(localizaciones.length);
    return localizaciones;
  }

  Future<List<GeoLocationData>> getGeoLocation(
      String latitud, String longitud) async {
    QueryMutation grap = QueryMutation();
    List<GeoLocationData> localizaciones = [];
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(
          document:
              gql(grap.geoLocations(latitud, longitud, "48" /*_prefs.id*/))),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    print(parsedJson);
    if (parsedJson != null) {
      for (var res in parsedJson["getGeo"]) {
        localizaciones.add(GeoLocationData.fromMap(res));
      }
    }

    return localizaciones;
  }
}
