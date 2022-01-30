part of 'widgets.dart';

class BarTitle extends StatelessWidget {
  const BarTitle({
    Key? key,
    required this.nameBar,
  }) : super(key: key);

  final String nameBar;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      from: 10,
      key: this.key,
      duration: Duration(seconds: 1),
      child: Text(
        nameBar,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
