part of 'widget_profile.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.urlImg,
  }) : super(key: key);

  final String urlImg;

  @override
  Widget build(BuildContext context) {
    final imageDefault = Image(
      image: AssetImage('assets/icons/hop.png'),
      fit: BoxFit.cover,
      height: 100.0,
      width: 100.0,
    );

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(blurRadius: 4.0, color: Colors.grey, spreadRadius: 3.0)
          ],
        ),
        child: ClipOval(
          child: FadeInImage(
            fit: BoxFit.cover,
            height: 100.0,
            width: 100.0,
            image: NetworkImage(urlImg),
            placeholder: AssetImage('assets/icons/hop.png'),
            placeholderErrorBuilder: (_, __, ___) => imageDefault,
            imageErrorBuilder: (_, __, ___) => imageDefault,
          ),
        ),
      ),
    );
  }
}
