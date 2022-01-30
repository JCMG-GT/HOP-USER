import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart' show TextEditingController, BuildContext;

import 'package:hopapp/src/domain/repositories/user_repository.dart';

import 'package:hopapp/src/utils/utils.dart' as utils;

part 'register_bloc_event.dart';
part 'register_bloc_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterState()) {
    on<RegisterFirstData>(_onFirstPageRegisterValidate);
  }

  final UserRepository _userRepository;

  final txtFullName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtUserName = TextEditingController();

  FutureOr<void> _onFirstPageRegisterValidate(
      RegisterFirstData event, Emitter<RegisterState> emit) async {
    if (txtFullName.text.isEmpty) {
      utils.alertValidation(
          event.context, AlertType.warning, "HOP", "Enter full name.");
    } else if (txtEmail.text.isEmpty) {
      utils.alertValidation(
          event.context, AlertType.warning, "HOP", "Enter your email.");
    } else if (txtUserName.text.isEmpty) {
      utils.alertValidation(
          event.context, AlertType.warning, "HOP", "Enter your User name.");
    } else if (txtPassword.text.isEmpty) {
      utils.alertValidation(
          event.context, AlertType.warning, "HOP", "Enter your password.");
    } else if (utils.isPasswordValid(txtPassword.text) == false) {
      utils.alertValidation(
          event.context, AlertType.warning, "HOP", "Password not valid.");
    } else if (utils.validateEmail(txtEmail.text) == false) {
      utils.alertValidation(
          event.context, AlertType.warning, "HOP", "Email not valid.");
    } else {
      Map<String, dynamic>? _validationEmail =
          await _userRepository.validateEmail(txtEmail.text);

      int idUserem =
          int.parse(_validationEmail!["validEmail"]["id"].toString());

      Map<String, dynamic>? infoUs =
          await _userRepository.validateUser(txtUserName.text);

      int idUser = int.parse(infoUs!["validUser"]["id"].toString());

      if (idUserem > 0) {
        utils.alertValidation(event.context, AlertType.warning, "HOP",
            "Sorry, that email address is already associated.");
        return;
      } else if (idUser > 0) {
        utils.alertValidation(event.context, AlertType.warning, "HOP",
            "Sorry, that user name is already associated.");
        return;
      } else {
        emit(state.copyWith(
          fullname: txtFullName.text,
          email: txtEmail.text,
          user: txtUserName.text,
          password: txtPassword.text,
          firstPageRegisterValidate: true,
        ));
      }
    }
  }
}
