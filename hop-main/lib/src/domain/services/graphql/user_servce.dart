part of 'graph_services.dart';

class UserService implements UserRepository {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  Future<Map<String, dynamic>?> validateEmail(String email) async {
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

  @override
  Future<Map<String, dynamic>?> validateUser(String usuario) async {
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
}
