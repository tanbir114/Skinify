import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'result_screen.dart';
import '../image_data.dart';
import '../image_provider.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => __ScanScreenState();
}

class __ScanScreenState extends State<ScanScreen> {
  File? _imageFile;
  final picker = ImagePicker();
  bool _loading = false;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _saveImage(_imageFile!);
      }
    });
  }

  Future<void> _saveImage(File imageFile) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String imagesDirPath = '$appDocPath/images';
    await Directory(imagesDirPath).create(recursive: true);

    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String fileName = 'image_$timestamp.jpg';
    String filePath = '$imagesDirPath/$fileName';

    try {
      await imageFile.copy(filePath);
      print('Image saved at: $filePath');
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  Future<void> _classifyImage() async {
    if (_imageFile == null) return;

    setState(() {
      _loading = true;
    });

    String apiUrl = 'http://192.168.0.196:3000/api/classify';
    var uri = Uri.parse(apiUrl);

    try {
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));
      request.headers.addAll({'Content-Type': 'multipart/form-data'});
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      setState(() {
        _loading = false;
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Save image data to provider
        Provider.of<ImageDataProvider>(context, listen: false).addImage(
          ImageData(imagePath: _imageFile!.path, diseaseType: data["result"]),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              diseaseType: data["result"],
              imagePath: _imageFile!.path,
            ),
          ),
        );
      } else {
        print('Failed to classify image: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skin Lesion Classifier',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal, 
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _imageFile != null
                    ? Image.file(_imageFile!, height: 200.0)
                    : Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'No image selected',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => _getImage(ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[400],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Pick Image',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _loading ? null : () => _classifyImage(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Classify Image',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (_loading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
