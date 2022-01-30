abstract class UserRepository {
  // Future<Usuario> getUser(String email, bool estudiante);
  // // Future<void> getUser(String id);

  // Future<CarnetEstado> getCarnetState(String email, bool estudiante);

  // Future<UserImage> getUserImage(String email, bool estudiante);

  Future<Map<String, dynamic>?> validateEmail(String email);
  Future<Map<String, dynamic>?> validateUser(String usuario);
}
