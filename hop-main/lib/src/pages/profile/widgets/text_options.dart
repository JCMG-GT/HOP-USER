part of 'widget_profile.dart';

class TextOptions extends StatelessWidget {
  const TextOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text(
            'Terms and Conditions',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            utils.showDialogConfirm(context, 'Are you sure?',
                'Are you sure you want to log out of your account?', () {
              Navigator.popUntil(context, ModalRoute.withName('login'));
              // Navigator.pushReplacementNamed(context, "login");
            });
          },
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            utils.showDialogConfirm(context, 'Are you sure?',
                'We\'re sorry to see you go. Are you sure you want to deactivate yopur account?',
                () async {
              Navigator.popUntil(context, ModalRoute.withName('login'));
            });
          },
          child: Text(
            'Deactivate account',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
