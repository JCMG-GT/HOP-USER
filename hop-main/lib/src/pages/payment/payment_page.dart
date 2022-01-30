import 'package:flutter/material.dart';
import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/pages/payment/widgets/widgets_payment.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';
import 'package:hopapp/src/routes/routes.dart';
import 'package:hopapp/src/utils/responsive.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomCloseButton(
            responsive: responsive,
          ),
          Column(
            children: [
              PaymentMethodSection(responsive: responsive),
              PaymentHistorysection(responsive: responsive),
            ],
          ),
          Container(),
        ],
      ))),
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final ResponsiveUtil responsive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleSection(
          responsive: responsive,
          title: 'Payment Method',
          key: Key('key_payment_method'),
        ),
        SizedBox(height: responsive.altoP(2)),
        Divider(),
        ListTile(
          onTap: () {},
          contentPadding:
              EdgeInsets.symmetric(horizontal: responsive.anchoP(10)),
          title: Text(
            '**** **** **** 0938',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          leading: Container(
            padding: EdgeInsets.all(responsive.altoP(0.5)),
            height: responsive.altoP(6),
            width: responsive.altoP(6),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image(
              image: AssetImage('assets/icons/visa.png'),
              fit: BoxFit.contain,
            ),
          ),
          trailing: Radio(
            value: true,
            groupValue: 1,
            onChanged: (value) {},
          ),
        ),
        Divider(),
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.newcard);
            },
            child: Text(
              '+ Add a card',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.altoP(3)),
      ],
    );
  }
}

class PaymentHistorysection extends StatelessWidget {
  const PaymentHistorysection({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final ResponsiveUtil responsive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleSection(
          responsive: responsive,
          title: 'Payment History',
          key: Key('key_payment_history'),
        ),
        Divider(),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: responsive.anchoP(10)),
          title: Text(
            'The Bar Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'VIP',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: Text(
            '\$47.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Divider(),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: responsive.anchoP(10)),
          title: Text(
            'The Bar Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'VIP',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: Text(
            '\$47.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Divider(),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: responsive.anchoP(10)),
          title: Text(
            'The Bar Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'VIP',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: Text(
            '\$47.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Divider(),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: responsive.anchoP(10)),
          title: Text(
            'The Bar Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'VIP',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: Text(
            '\$47.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Divider(),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: responsive.anchoP(10)),
          title: Text(
            'The Bar Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'VIP',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: Text(
            '\$47.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Divider(),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: responsive.anchoP(10)),
          title: Text(
            'The Bar Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'VIP',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: Text(
            '\$47.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: responsive.altoP(5)),
      ],
    );
  }
}
