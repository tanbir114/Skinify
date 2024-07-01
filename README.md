# Skin Disease Detection Frontend

This repository contains the frontend code for the Skin Disease Detection project. The frontend is built using Flutter and provides an interface for users to upload images of skin diseases and view the results of the analysis.

## Features

- Search for skin problems
- View recent scans
- Upload images for analysis
- Display detailed results of the analysis

## Technologies Used

- Flutter
- Dart
- Carousel Slider
- Provider

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/skin-disease-frontend.git
cd skin-disease-frontend
flutter pub get
flutter run

Folder Structure
.
├── lib
│   ├── screens
│   │   ├── home_screen.dart
│   │   ├── scan_screen.dart
│   │   ├── result_screen.dart
│   │   ├── all_scans_screen.dart
│   ├── providers
│   │   └── image_provider.dart
│   ├── const.dart
│   └── main.dart
├── assets
│   └── images
│       └── skin-disease_5424095.png
└── pubspec.yaml
