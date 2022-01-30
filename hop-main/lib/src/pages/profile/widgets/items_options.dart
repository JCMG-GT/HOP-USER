part of 'widget_profile.dart';

class ItemsOptions extends StatelessWidget {
  const ItemsOptions({Key? key, required this.responsive}) : super(key: key);

  final ResponsiveUtil responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: responsive.altoP(40),
      ),
      child: Column(
        children: <Widget>[
          Divider(),
          _ItemProfileOption(
            title: 'Personal Details',
            function: () => Navigator.pushNamed(context, AppRoutes.editProfile),
            icon: Icons.person,
            responsive: responsive,
          ),
          Divider(),
          _ItemProfileOption(
            title: 'VIP',
            function: () {},
            icon: Icons.local_activity,
            responsive: responsive,
          ),
          Divider(),
        ],
      ),
    );
  }
}

class _ItemProfileOption extends StatelessWidget {
  const _ItemProfileOption({
    Key? key,
    required this.function,
    required this.title,
    required this.responsive,
    required this.icon,
  }) : super(key: key);

  final Function function;
  final String title;

  final ResponsiveUtil responsive;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => function(),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
          ),
          SizedBox(width: responsive.anchoP(5)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Icon(Icons.arrow_right_rounded),
        ],
      ),
      padding: EdgeInsets.symmetric(
          horizontal: responsive.anchoP(10.0), vertical: responsive.altoP(3.0)),
    );
  }
}
