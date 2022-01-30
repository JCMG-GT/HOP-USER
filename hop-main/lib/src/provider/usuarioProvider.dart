import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hopapp/src/models/generoModel.dart';
import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';
import 'package:hopapp/src/parameterClass/secundRegisterModel.dart';
import 'package:hopapp/src/domain/services/graphql/mutations/queryMutation.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class UsuarioProvider {
  final _prefs = new PreferenciasUsuario();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation callMutation = QueryMutation();
  //final _prefs = new PreferenciasUsuario();
  Future<Map<String, dynamic>> login(String? email, String clave) async {
    QueryMutation _logiUser = QueryMutation();
    final variable = {
      "input": {
        "email": email,
        "clave": generateSHA256(clave),
      }
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_logiUser.loginUs()), variables: variable),
    );
    var parsedJson = json.decode(jsonEncode(queryResult.data));

    Map<String, dynamic> decodeResp = parsedJson;

    int idValor = 0;
    idValor = int.parse(decodeResp['login']['id'].toString());

    if (idValor > 0) {
      _prefs.id = idValor.toString();
      _prefs.nombre = decodeResp["login"]['nombre'].toString();
      _prefs.email = decodeResp["login"]['email'].toString();
      _prefs.url = decodeResp["login"]['url'].toString();
      _prefs.celular = decodeResp["login"]['celular'].toString();
    }

    return decodeResp;
  }

  Future<Map<String, dynamic>?> grabarUsuario(SecundRegister data) async {
    QueryMutation _graph = QueryMutation();

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    final variable = {
      "input": {
        "nombre": data.fullname,
        "email": data.email,
        "clave": generateSHA256(data.password!),
        "celular": data.number,
        "fec_nac": convertDate(data.date),
        "id_genero": data.gender,
        "fec_ing": formattedDate,
        "tipo_usr": "1",
        "estado": "0",
        "usuario": data.user
      }
    };
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(_graph.insertUser()), variables: variable),
    );
    var parsedJson = json.decode(jsonEncode(queryResult.data));

    Map<String, dynamic> decodeResp = parsedJson;

    int idValor = 0;
    idValor = int.parse(decodeResp["intoUsuarios"]['id'].toString());

    if (idValor > 0) {
      _prefs.id = idValor.toString();
      _prefs.nombre = decodeResp["intoUsuarios"]['nombre'].toString();
      _prefs.email = decodeResp["intoUsuarios"]['email'].toString();
    }

    return decodeResp["intoUsuarios"];
  }

  Future<List<GeneroModel>> listaGeneros() async {
    List<GeneroModel> listaPreguntasSeg = [];

    QueryMutation grap = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult queryResult = await _client.mutate(
      MutationOptions(document: gql(grap.getAllGender())),
    );

    var parsedJson = json.decode(jsonEncode(queryResult.data));

    for (var Regs in parsedJson["getAllGenero"]) {
      listaPreguntasSeg.add(GeneroModel.fromJson(Regs));
    }

    return listaPreguntasSeg;
  }

  List<DropdownMenuItem<String>> lwDdmItemsPreg(
      List<GeneroModel> lmCmbOptions) {
    List<DropdownMenuItem<String>> lWidgets = <DropdownMenuItem<String>>[];
    lmCmbOptions.forEach((row) {
      lWidgets.add(DropdownMenuItem(
          value: (row.id.toString()),
          child: SingleChildScrollView(
              child: Text(
            row.descripcion!,
            style: TextStyle(color: Colors.black, fontSize: 12.00),
          ))));
    });
    return lWidgets;
  }

  String generateSHA256(String input) {
    var bytes1 = utf8.encode(input);
    var digest1 = sha256.convert(bytes1);
    var result = digest1.toString();
    return result;
  }

  Future<Map<String, dynamic>?> validaCorreo(String email) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    var mutationOptions = MutationOptions(
        document: gql(ValidatorsMutations.validEmail(email.trim())));
    QueryResult queryResult = await _client.mutate(
      mutationOptions,
    );
    var parsedJson = json.decode(jsonEncode(queryResult.data));
    Map<String, dynamic>? decodeResp = parsedJson;

    return decodeResp;
  }

  Future<Map<String, dynamic>?> validaUsuario(String usuario) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    var mutationOptions = MutationOptions(
        document: gql(ValidatorsMutations.validUser(usuario.trim())));
    QueryResult queryResult = await _client.mutate(
      mutationOptions,
    );
    var parsedJson = json.decode(jsonEncode(queryResult.data));
    Map<String, dynamic>? decodeResp = parsedJson;
    return decodeResp;
  }

  String convertDate(String? picked) {
    var formatter = new DateFormat("MM/dd/yyyy");
    var inputDate = formatter.parse(picked.toString().trim().substring(0, 10));

    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }
}
