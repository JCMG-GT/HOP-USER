part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.maxWidth = 300.0,
    this.minHeight = 50.0,
    this.fontSize = 16.0,
    this.backGroundGray = false,
    this.gradient = true,
    this.colorPrimary,
  }) : super(key: key);

  final Function onPressed;
  final String title;
  final double maxWidth, minHeight;
  final double fontSize;
  final bool backGroundGray, gradient;
  final Color? colorPrimary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
      ),
      child: Ink(
        decoration: BoxDecoration(
            color: colorPrimary,
            gradient: gradient
                ? !backGroundGray
                    //Blue gradiente
                    ? LinearGradient(
                        colors: [
                          Color.fromARGB(255, 86, 39, 158),
                          Color.fromARGB(255, 31, 108, 255),
                          Color.fromARGB(255, 31, 108, 255)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : LinearGradient(
                        colors: [
                          Color(0xff9CA9BD),
                          Color(0xff9FA6B8),
                          Color(0xff9CA9BD),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                : null,
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth, minHeight: minHeight),
          alignment: Alignment.center,
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize)),
        ),
      ),
    );
  }
}

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    Key? key,
    required this.responsive,
    this.marginRigth,
  }) : super(key: key);

  final ResponsiveUtil responsive;
  final double? marginRigth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Hero(
        tag: 'tag_back_btn',
        child: Material(
          child: CircleButtomCustom(
              marginTop: responsive.altoP(2.0),
              marginRigth: marginRigth ?? responsive.anchoP(7),
              icon: Icons.close,
              iconColor: AppColors.primary,
              function: () => Navigator.pop(context)),
        ),
      ),
    );
  }
}
