import 'dart:io';

void main(List<String> arguments) {
  print('\n🚀 Generating Scalable Clean Architecture Folder Structure...');

  bool exists = false;

  final folders = [
    // Core Structure
    'lib/core/constants',
    'lib/core/errors',
    'lib/core/network',
    'lib/core/usecases',
    'lib/core/utils',

    // Features Base Directory
    'lib/features/',

    // Dependency Injection
  ];

  final files = [
    'lib/main.dart',
    'lib/injection_container.dart',
  ];

  for (var folder in folders) {
    final dir = Directory(folder);
    if (dir.existsSync()) {
      exists = true;
    } else {
      dir.createSync(recursive: true);
      print('✅ Created: $folder');
    }
  }

  for (var filePath in files) {
    final file = File(filePath);
    if (file.existsSync()) {
      exists = true;
    } else {
      file.createSync(recursive: true);
      print('📄 Created file: $filePath');
    }
  }

  if (exists) {
    print('\n❌ Some files/folders already exist. Please run this only once per base project.');
  } else {
    print('\n🎯 Project structure created successfully.');
  }

  // Optional: Ask if user wants to create first feature
  stdout.write('\n✨ Do you want to create a feature now? (y/n): ');
  final input = stdin.readLineSync();

  if (input?.toLowerCase() == 'y') {
    stdout.write('📦 Enter feature name (e.g. login): ');
    final featureName = stdin.readLineSync()?.trim();

    if (featureName != null && featureName.isNotEmpty) {
      _generateFeatureStructure(featureName);
    } else {
      print('⚠️ Invalid feature name.');
    }
  }
}

void _generateFeatureStructure(String name) {
  final basePath = 'lib/features/$name';

  final folders = [
    '$basePath/data/datasources',
    '$basePath/data/models',
    '$basePath/data/repositories',
    '$basePath/domain/entities',
    '$basePath/domain/repositories',
    '$basePath/domain/usecases',
    '$basePath/presentation/bloc',
    '$basePath/presentation/pages',
    '$basePath/presentation/widgets',
    '$basePath/presentation/components',
  ];

  bool duplicate = false;

  for (var folder in folders) {
    final dir = Directory(folder);
    if (dir.existsSync()) {
      duplicate = true;
    } else {
      dir.createSync(recursive: true);
      print('🧱 Created: $folder');
    }
  }

  if (duplicate) {
    print('\n⚠️ Feature "$name" already partially exists.');
  } else {
    print('\n✅ Feature "$name" structure generated.');
  }
}
