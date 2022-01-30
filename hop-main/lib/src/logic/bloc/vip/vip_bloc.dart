import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vip_event.dart';
part 'vip_state.dart';

class VipBloc extends Bloc<VipEvent, VipState> {
  VipBloc() : super(VipLoading());

  @override
  Stream<VipState> mapEventToState(VipEvent event) async* {
    if (event is LoadVip) {
      await Future.delayed(const Duration(seconds: 2));
      yield VipRequired(
        name: 'Carpent\'s Bar',
        costVip: '\$20/month',
        featuresVip: ['Unlimited Line Skips', 'No Cover'],
      );
      // yield state.copyWith(infoTab: !state.infoTab);
    } else if (event is GetVip) {
      // await Future.delayed(const Duration(seconds: 1));
      print(DateTime.now());
      yield VipGaranted(
        name: 'Carpent\'s Bar',
        costVip: '\$20/month',
        featuresVip: ['Unlimited Line Skips', 'No Cover'],
        startDate: DateTime.now(),
      );
    } else if (event is CancelVip) {
      // await Future.delayed(const Duration(seconds: 1));
      yield VipRequired(
        name: 'Carpent\'s Bar',
        costVip: '\$20/month',
        featuresVip: ['Unlimited Line Skips', 'No Cover'],
      );
    }
  }
}
