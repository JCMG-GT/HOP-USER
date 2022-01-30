import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTab { map, main, qr }

class HomeNavigationCubit extends Cubit<AppTab> {
  HomeNavigationCubit() : super(AppTab.map);

  void onChangeTab(AppTab tab) {
    if (tab != state) emit(tab);
  }

  AppTab getTab() {
    return state;
  }
}
