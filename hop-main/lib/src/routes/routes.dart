import 'package:flutter/material.dart';
import 'package:hopapp/src/pages/Qr/qrInformation.dart';
import 'package:hopapp/src/pages/bar/bar_hop_page.dart';
import 'package:hopapp/src/pages/register/first_register.dart';
import 'package:hopapp/src/pages/friends/add_amigos_contacts.dart';
import 'package:hopapp/src/pages/friends/friends_page.dart';
import 'package:hopapp/src/pages/home/home_page.dart';
import 'package:hopapp/src/pages/info_bar/info_bar.dart';
import 'package:hopapp/src/pages/login.dart';
import 'package:hopapp/src/pages/menu_profile.dart';
import 'package:hopapp/src/pages/payment.dart';
import 'package:hopapp/src/pages/payment/new_card_page.dart';
import 'package:hopapp/src/pages/payment/payment_page.dart';
import 'package:hopapp/src/pages/permisos.dart';
import 'package:hopapp/src/pages/profile.dart';
import 'package:hopapp/src/pages/Qr/qrPayment.dart';
import 'package:hopapp/src/pages/profile/edit_profile.dart';
import 'package:hopapp/src/pages/profile/profile_page.dart';
import 'package:hopapp/src/pages/qr_generator.dart';
import 'package:hopapp/src/pages/register/secund_register.dart';
import 'package:hopapp/src/pages/settings_page/sttings_page.dart';
import 'package:hopapp/src/pages/home/tab_map/maps_sample.dart';
import 'package:hopapp/src/pages/paymentHistory.dart';
import 'package:hopapp/src/pages/vip/become_vip_page.dart';
import 'package:hopapp/src/pages/welcome.dart';

class AppRoutes {
  static const String barHop = 'barHop';
  static const String becomeVIP = 'becomevip';
  static const String settings = 'settings';
  static const String profile = 'profile';
  static const String editProfile = 'editProfile';
  static const String payment = 'payment';
  static const String newcard = 'newcard';
  static const String firends = 'firends';
}

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    AppRoutes.barHop: (BuildContext context) => BarHop(),
    AppRoutes.becomeVIP: (BuildContext context) => BecomeVip(),
    AppRoutes.settings: (BuildContext context) => SettingsPage(),
    AppRoutes.profile: (BuildContext context) => ProfilePage(),
    AppRoutes.editProfile: (BuildContext context) => EditProfilePage(),
    AppRoutes.payment: (BuildContext context) => PaymentPage(),
    AppRoutes.newcard: (BuildContext context) => NewCardPage(),
    AppRoutes.firends: (BuildContext context) => FriendsPage(),

    ///

    '/': (BuildContext context) => WelcomePage(),
    'login': (BuildContext context) => LoginPage(),
    '1Register': (BuildContext context) => Register1Page(),
    '2Register': (BuildContext context) => Register2Page(),
    'Payment': (BuildContext context) => Payment(),
    'Profile': (BuildContext context) => MenuProfile(),
    'MenuProfile': (BuildContext context) => Profile(),
    'QRGenerator': (BuildContext context) => QrGenerator(),
    'InfoBar': (BuildContext context) => InfoBar.init(),
    'mapa': (BuildContext context) => MapSample(),
    'home': (BuildContext context) => HomePage(),
    'addamigos': (BuildContext context) => AddAmigos.init(),
    'permisos': (BuildContext context) => Permisos(),
    'PaymentHistory': (BuildContext context) => PaymentHistory(),
    'QrPayment': (BuildContext context) => QrPayment(),
    'QrInformation': (BuildContext context) => QrInformation()
  };
}
