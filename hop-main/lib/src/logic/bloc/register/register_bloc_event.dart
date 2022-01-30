part of 'register_bloc_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterFirstData extends RegisterEvent {
  RegisterFirstData({required this.context});
  final BuildContext context;
}
