/// File and folder utility functions for Blocraft CLI.
library file_utils;

import 'dart:io';

/// Creates a folder at the given path if it does not already exist.
void createFolder(String basePath, String relativePath) {
  final dir = Directory('$basePath/$relativePath');
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
    print('📁 Created: ${dir.path}');
  } else {
    print('📂 Exists: ${dir.path}');
  }
}
