import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ImgConverter {
  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String), fit: BoxFit.cover);
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Future<String> assetImgToData(AssetImage img) async {
    final ByteData bytes = await rootBundle.load(img.assetName);
    final Uint8List data = bytes.buffer.asUint8List();
    final String base64Image = base64Encode(data);
    return base64Image;
  }

  static Future<String> fileImgToBase64(File imageFile) async {
    final Uint8List imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }
}
