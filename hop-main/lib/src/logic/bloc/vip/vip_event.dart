part of 'vip_bloc.dart';

@immutable
abstract class VipEvent {}

class LoadVip extends VipEvent {}

class GetVip extends VipEvent {}

class CancelVip extends VipEvent {}
