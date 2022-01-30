part of 'widgets_tab_discover.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final ResponsiveUtil responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: responsive.altoP(4.0), left: responsive.anchoP(7)),
      height: responsive.altoP(6.0),
      width: responsive.anchoP(90),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade300,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(left: 20.0, right: 28.0),
          //   child: Text(
          //     'Search venues...',
          //     style: TextStyle(color: AppColors.gris),
          //     maxLines: 1,
          //   ),
          // ),
          SizedBox(
            width: responsive.anchoP(60),
            child: TextField(
              autofocus: false,
              onSubmitted: (value) {
                print('Textfield: $value');
              },
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Search venues...',
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 50,
            width: 0.2,
            color: Colors.grey,
          ),
          SizedBox(width: 8),
          GestureDetector(
            child: Icon(
              Icons.person_add,
              // size: ,
              color: AppColors.gris,
            ),
            onTap: () {
              // Navigator.pushNamed(context, 'addamigos');
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
