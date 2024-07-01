import 'dart:io';

import 'package:flutter/material.dart';
import '../const.dart';

class ResultScreen extends StatelessWidget {
  final String diseaseType;
  final String imagePath;

  const ResultScreen({
    Key? key,
    required this.diseaseType,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(diseaseType);
    Map<String, dynamic> diseaseData = getDiseaseData(diseaseType);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classification Result', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          diseaseData['name'] ?? 'Unknown Disease',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          diseaseData['description'] ?? 'No description available',
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(
                        File(imagePath),
                        height: 150,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (diseaseData['cause'] != null)
              _buildSectionTitle('Cause:'),
              if (diseaseData['cause'] != null)
                _buildTextFromList(diseaseData['cause']['pathogen'], 'Pathogen:'),
              // if (diseaseData['cause']['Transmission'] != null)
              //   _buildTextList('Transmission:', diseaseData['cause']['transmission']),
              const SizedBox(height: 10),
              if (diseaseData['symptoms'] != null)
              _buildSectionTitle('Symptoms:'),
              if (diseaseData['symptoms'] != null)
                _buildTextList('Initial Symptoms:', diseaseData['symptoms']['initial']),
              if (diseaseData['symptoms'] != null)
                _buildTextList('Rash Development:', diseaseData['symptoms']['rash_development']),
              const SizedBox(height: 10),
              if (diseaseData['diagnosis'] != null)
              _buildSectionTitle('Diagnosis:'),
              if (diseaseData['diagnosis'] != null)
                _buildTextFromList(diseaseData['diagnosis']['clinical_observation'], 'Clinical Observation:'),
              if (diseaseData['diagnosis'] != null)
                _buildTextList('Laboratory Tests:', diseaseData['diagnosis']['laboratory_tests']),
              const SizedBox(height: 10),
              if (diseaseData['treatment'] != null)
              _buildSectionTitle('Treatment:'),
              if (diseaseData['treatment']['recommendations'] != null)
                _buildTextList('R ecommendations:', diseaseData['treatment']['recommendations']),
              if (diseaseData['treatment']['home_care'] != null)
                _buildTextList('Home Care:', diseaseData['treatment']['home_care']),
              if (diseaseData['treatment']['medical_treatment'] != null)
                _buildTextList('Medical Treatment:', diseaseData['treatment']['medical_treatment']),
              const SizedBox(height: 10),
              if (diseaseData['prevention'] != null)
              _buildSectionTitle('Prevention:'),
              if (diseaseData['prevention'] != null)
                _buildTextFromList(diseaseData['prevention']['vaccination'], 'Vaccination:'),
              if (diseaseData['prevention'] != null)
                _buildTextFromList(diseaseData['prevention']['isolation'], 'Isolation:'),
              const SizedBox(height: 10),
              _buildSectionTitle('Prognosis:'),
              Text(
                diseaseData['prognosis'] ?? 'No prognosis available',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              if (diseaseData['resources'] != null)
              _buildSectionTitle('Resources:'),
              if (diseaseData['resources'] != null)
                _buildWebSitesList(diseaseData['resources']['websites']),
              if (diseaseData['resources'] != null)
                _buildHotlinesList(diseaseData['resources']['hotlines']),
              const SizedBox(height: 20),
              Text(
                diseaseData['motivation'] ?? '', // Display motivation if available
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const SizedBox(height: 5),
        const Divider(color: Colors.teal),
      ],
    );
  }

   Widget _buildTextList(String title, List<String>? list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyan),
        ),
        const SizedBox(height: 5),
        if (list != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              list.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  '- ${list[index]}',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
          ),
      ],
    );
  }
  Widget _buildTextFromList(String? text, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              '$title $text',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
      ],
    );
  }

  Widget _buildWebSitesList(List<dynamic>? websites) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (websites != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              websites.length,
              (index) => InkWell(
                onTap: () {
                  // Open website URL
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                  child: Text(
                    '- ${websites[index]['name']}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHotlinesList(List<dynamic>? hotlines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        const Text(
          'Hotlines (Bangladesh):',
          style: TextStyle(fontSize: 16, color: Colors.teal),
        ),
        if (hotlines != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              hotlines.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  '- ${hotlines[index]['name']}: ${hotlines[index]['phone']}',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
