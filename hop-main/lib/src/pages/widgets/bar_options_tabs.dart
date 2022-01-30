part of 'widgets.dart';

class OptionTabs extends StatelessWidget {
  const OptionTabs({
    Key? key,
    required this.friendsNumber,
  }) : super(key: key);

  final String friendsNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarInfoBloc, BarInfoState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(18.0).copyWith(
            bottom: 30.0,
          ),
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActionChip(
                onPressed: !state.infoTab
                    ? () {
                        context.read<BarInfoBloc>().add(OnTabChanged());
                      }
                    : () {},
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Container(
                  width: 100,
                  child: Text(
                    'Info',
                    style: TextStyle(
                      color: state.infoTab ? Colors.white : AppColors.primary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                elevation: 5.0,
                backgroundColor:
                    state.infoTab ? AppColors.primary : Colors.white,
              ),
              SizedBox(width: 5.0),
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  ActionChip(
                    onPressed: state.infoTab
                        ? () {
                            context.read<BarInfoBloc>().add(OnTabChanged());
                          }
                        : () {},
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Container(
                      width: 100,
                      child: Text(
                        'Friends',
                        style: TextStyle(
                          color:
                              state.infoTab ? AppColors.primary : Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    elevation: 5.0,
                    backgroundColor:
                        state.infoTab ? Colors.white : AppColors.primary,
                  ),
                  state.infoTab
                      ? Positioned(
                          right: -8.0,
                          top: -15.0,
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                '10',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                // textScaleFactor: 0.9,
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
