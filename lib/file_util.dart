import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> copyAssetToFile(String assetPath, String fileName) async {
  try {
    final byteData = await rootBundle.load(assetPath);
    final buffer = byteData.buffer;

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';

    final file = File(filePath);
    await file.writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return filePath;
  } catch (e) {
    print('Error copying asset to file: $e');
    rethrow;
  }
}
