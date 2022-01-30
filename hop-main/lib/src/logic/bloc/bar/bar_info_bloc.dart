import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bar_info_event.dart';
part 'bar_info_state.dart';

class BarInfoBloc extends Bloc<BarInfoEvent, BarInfoState> {
  BarInfoBloc() : super(BarInfoState());

  @override
  Stream<BarInfoState> mapEventToState(BarInfoEvent event) async* {
    if (event is OnTabChanged) {
      yield state.copyWith(infoTab: !state.infoTab);
    }
  }
}
