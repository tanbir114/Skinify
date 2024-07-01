import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../image_provider.dart';
import 'result_screen.dart';

class AllScansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('All Scans',style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<ImageDataProvider>(
        builder: (context, imageDataProvider, child) {
          if (imageDataProvider.imageDataList.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text('No Scans Available', style: TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: imageDataProvider.imageDataList.length,
              itemBuilder: (context, index) {
                final imageData = imageDataProvider.imageDataList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15.0),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(imageData.imagePath),
                        width: 70,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      imageData.diseaseType,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            diseaseType: imageData.diseaseType,
                            imagePath: imageData.imagePath,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
