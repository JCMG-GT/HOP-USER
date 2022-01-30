import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(DiscoverState());

  @override
  Stream<DiscoverState> mapEventToState(DiscoverEvent event) async* {
    if (event is OnFavoriteSelect) {
      yield state.copyWith(loading: true, favorite: !state.favorite!);
      await Future.delayed(const Duration(seconds: 1));
      yield state.copyWith(loading: false);
    }
  }
}
