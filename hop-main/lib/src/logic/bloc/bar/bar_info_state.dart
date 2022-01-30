part of 'bar_info_bloc.dart';

@immutable
class BarInfoState {
  BarInfoState({
    this.infoTab = true,
  });

  BarInfoState copyWith({
    bool? infoTab,
  }) =>
      BarInfoState(
        infoTab: infoTab ?? this.infoTab,
      );

  final bool infoTab;
}
