part of 'register_bloc_bloc.dart';

@immutable
class RegisterState {
  const RegisterState({
    this.fullname,
    this.email,
    this.user,
    this.password,
    this.firstPageRegisterValidate = false,
  });

  RegisterState copyWith({
    String? fullname,
    String? email,
    String? user,
    String? password,
    bool? firstPageRegisterValidate,
  }) =>
      RegisterState(
        email: email ?? this.email,
        fullname: fullname ?? this.fullname,
        user: user ?? this.user,
        password: password ?? this.password,
        firstPageRegisterValidate:
            firstPageRegisterValidate ?? this.firstPageRegisterValidate,
      );
  final String? fullname;
  final String? email;
  final String? user;
  final String? password;

  final bool firstPageRegisterValidate;
}
