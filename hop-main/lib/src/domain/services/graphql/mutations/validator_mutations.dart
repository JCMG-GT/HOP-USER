class ValidatorsMutations {
  static String validEmail(String email) {
    return '''
      mutation {
        validEmail(input: {email:  "$email"}) {
          id
        }
      }
    ''';
  }

  static String validUser(String user) {
    return '''
    mutation {
              validUser(input: {usuario: "$user"}) {
                id
              }
            }
    ''';
  }
}
