import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/models/addCard.dart';
import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';
import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class PaymentProvider {
  final _prefs = new PreferenciasUsuario();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();

  Future<Map<String, dynamic>> grabarTarjeta(CardPaymentModel card) async {
    QueryMutation _graph = QueryMutation();
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    final variable = {
      "input": {
        "id_usr": _prefs.id,
        "nombre": card.name,
        "numero": card.card.toString().replaceAll("-", ""),
        "expira": card.expiration,
        "cvv": card.cvv,
        "fec_ing": formattedDate,
        "estado": "1"
      }
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.insertCard()), variables: variable),
    );
    var parsedJson = json.decode(jsonEncode(queryResult.data));

    Map<String, dynamic> decodeResp = parsedJson;
    if (decodeResp.length > 0) {
      return {'estado': true, 'mensaje': 'Tarjeta Grabada'};
    } else {
      return {'estado': false, 'mensaje': 'Trjeta No Grabada'};
    }
  }
}
