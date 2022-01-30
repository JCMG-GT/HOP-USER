import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsListRequestCubit extends Cubit<int> {
  FriendsListRequestCubit(this.listLength) : super(2);
  final int listLength;

  void onSelect() {
    if (listLength != state)
      emit(listLength);
    else
      emit(2);
  }
}

class FriendsListQuickCubit extends Cubit<int> {
  FriendsListQuickCubit(this.listLength) : super(2);
  final int listLength;

  void onSelect() {
    if (listLength != state)
      emit(listLength);
    else
      emit(2);
  }
}
