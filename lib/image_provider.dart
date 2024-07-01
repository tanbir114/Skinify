import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'image_data.dart';

class ImageDataProvider with ChangeNotifier {
  List<ImageData> _imageDataList = [];

  List<ImageData> get imageDataList => _imageDataList;

  void addImage(ImageData imageData) {
    _imageDataList.add(imageData);
    notifyListeners();
  }

  Future<void> addDummyData() async {
    try {
      final cowpoxPath = await copyAssetToFile('assets/CWP_02_01.png', 'CWP_02_01.png');
      final monkeypoxPath = await copyAssetToFile('assets/monkeypox.jpg', 'monkeypox.jpg');
      final mslPath = await copyAssetToFile('assets/MSL.jpg', 'MSL.jpg');

      _imageDataList = [
        ImageData(imagePath: cowpoxPath, diseaseType: 'Cowpox'),
        ImageData(imagePath: monkeypoxPath, diseaseType: 'Monkeypox'),
        ImageData(imagePath: mslPath, diseaseType: 'Chickenpox'),
      ];
      notifyListeners();
    } catch (e) {
      print('Error adding dummy data: $e');
    }
  }
}

Future<String> copyAssetToFile(String assetPath, String fileName) async {
  try {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String imagesDirPath = '$appDocPath/images';
    await Directory(assetPath).create(recursive: true);

    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String fileName = 'image_$timestamp.jpg';
    String filePath = '$imagesDirPath/$fileName';
    return filePath;
  } catch (e) {
    print('Error copying asset to file: $e');
    rethrow;
  }
}
