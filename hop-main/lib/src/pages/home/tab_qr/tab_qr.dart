import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';

// import 'package:qr_flutter/qr_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'package:hopapp/src/config/app_colors.dart';

import 'package:hopapp/src/utils/responsive.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

class TabQR extends StatelessWidget {
  const TabQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Container(
      padding: EdgeInsets.only(top: responsive.altoP(5)),
      color: Colors.white,
      width: responsive.width,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                padding: EdgeInsets.only(left: responsive.anchoP(5)),
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline_rounded,
                  size: 30,
                  color: AppColors.primary,
                )),
          ),
          SizedBox(height: responsive.altoP(8)),
          Shimmer.fromColors(
            highlightColor: Color.fromARGB(255, 86, 39, 158),
            baseColor: Color.fromARGB(255, 31, 108, 255),
            period: Duration(seconds: 5),
            child: PrettyQr(
                data: "..dasf",
                size: responsive.altoP(35),
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true,
                // elementColor: Gradient(colors: [Colors.black, Colors.black]),
                // elementColor: Colors.white,
                typeNumber: 4,
                image: AssetImage('assets/icons/hop.png')),
          ),
          SizedBox(height: responsive.altoP(9)),
          CustomButton(
            onPressed: () {},
            title: "Close",
          ),
          SizedBox(height: responsive.altoP(4)),
          TextButton(
            child: Text("Edit Payment Method"),
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
