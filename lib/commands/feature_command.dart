import 'dart:io';
import 'package:blocraft/utils/file_utils.dart';

void runFeatureCommand(String featureName) {
  final baseDir = Directory('lib/src');
  final folders = [
    'features/$featureName/data/datasources',
    'features/$featureName/data/models',
    'features/$featureName/data/repositories',
    'features/$featureName/domain/entities',
    'features/$featureName/domain/repositories',
    'features/$featureName/domain/usecases',
    'features/$featureName/presentation/bloc',
    'features/$featureName/presentation/pages',
  ];

  for (final folder in folders) {
    createFolder(baseDir.path, folder);
  }

  print('\n✅ The "$featureName" feature structure has been successfully created.');
}
