/// Project structure utilities for Blocraft CLI.
///
/// Contains functions to create the recommended folder structure for Flutter projects.
library project_structure;

import 'dart:io';
import 'package:blocraft/utils/file_utils.dart';

/// Creates the base folder structure under lib/src/ for core, shared, and features.
void createProjectStructure() {
  final baseDir = Directory('lib/src');
  final folders = [
    'core/error',
    'core/utils',
    'core/theme',
    'core/routes',
    'shared/usecases',
    'shared/widgets',
    'shared/helpers',
    'features',
  ];

  for (final folder in folders) {
    createFolder(baseDir.path, folder);
  }
}
