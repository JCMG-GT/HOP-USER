import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:hopapp/src/models/Items.dart';

class Global {
  static Items misItems = new Items();

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
