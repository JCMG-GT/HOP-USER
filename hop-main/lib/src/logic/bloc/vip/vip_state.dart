part of 'vip_bloc.dart';

@immutable
abstract class VipState {}

class VipLoading extends VipState {}

class VipRequired extends VipState {
  VipRequired({
    this.name,
    this.costVip,
    this.featuresVip,
  });

  VipRequired copyWith({
    String? name,
    String? costVip,
    List<String>? featutesVip,
  }) =>
      VipRequired(
        name: name ?? this.name,
        costVip: costVip ?? this.costVip,
        featuresVip: featuresVip ?? this.featuresVip,
      );

  final String? name;
  final String? costVip;
  final List<String>? featuresVip;
}

class VipGaranted extends VipState {
  VipGaranted({
    this.name,
    this.costVip,
    this.featuresVip,
    this.startDate,
  });

  VipGaranted copyWith({
    String? name,
    String? costVip,
    List<String>? featutesVip,
    DateTime? startDate,
  }) =>
      VipGaranted(
        name: name ?? this.name,
        costVip: costVip ?? this.costVip,
        featuresVip: featuresVip ?? this.featuresVip,
        startDate: startDate ?? this.startDate,
      );

  final String? name;
  final String? costVip;
  final List<String>? featuresVip;
  final DateTime? startDate;
}
// class VipLoading extends VipState {}
// 
