part of 'widgets_tab_discover.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Hop Venues",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            decoration: TextDecoration.none,
            color: Colors.black,
          ),
        ),
        // Spacer(),
        BlocBuilder<DiscoverBloc, DiscoverState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () =>
                  context.read<DiscoverBloc>().add(OnFavoriteSelect()),
              icon: Icon(
                state.favorite! ? Icons.favorite_border : Icons.favorite,
                color: Colors.red,
                size: 30.0,
              ),
            );
          },
        ),
        // Spacer()

        Material(
          color: Colors.transparent,
          child: IconButton(
            splashRadius: 25,
            visualDensity: VisualDensity.standard,
            color: AppColors.primary,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settings);
            },
            icon: Icon(
              Icons.person,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
