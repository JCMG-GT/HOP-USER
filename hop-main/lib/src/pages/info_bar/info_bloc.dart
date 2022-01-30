import 'package:flutter/material.dart';
import 'package:hopapp/src/parameterClass/informationBarModel.dart';
import 'package:hopapp/src/provider/barProvider.dart';
import 'package:hopapp/src/utils/utils.dart';

class InfoBloc with ChangeNotifier {
  var contextInfo;
  load(context) {
    contextInfo = context;
  }

  List<String?> favorites = [];

  void info() async {
    ProgressDialog dialog = ProgressDialog(contextInfo);
    dialog.show();
    final InfoBarArgModel args =
        ModalRoute.of(contextInfo)!.settings.arguments as InfoBarArgModel;
    BarProviders bar = new BarProviders();
    Map<String, dynamic>? info = await bar.infoVIP(args.id);
    print(info!["descripProd"]);
    favorites.clear();
    for (var descrip in info["descripProd"]) {
      print("-------");
      print(descrip);
      favorites.add(descrip['descripproducto']);
    }

    notifyListeners();
    dialog.dismiss();
  }
}
