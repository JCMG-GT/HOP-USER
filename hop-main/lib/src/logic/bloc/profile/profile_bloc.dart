import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:hopapp/src/provider/usuarioProvider.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required userProvider,
  })  : _userProvider = userProvider,
        super(ProfileInitial());

  final UsuarioProvider _userProvider;

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    // if (event is LoadStores) {
    //   print("Bloc loading");
    //   final stores = await _storesRepository.getStores();
    //   yield StoresLoaded();
    // }
  }
}
