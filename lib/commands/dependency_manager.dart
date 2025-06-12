/// Dependency management utilities for Blocraft CLI.
///
/// Handles injecting required dependencies and dev_dependencies into pubspec.yaml.
library dependency_manager;

import 'dart:io';
import 'package:blocraft/helpers/state_helper.dart';


/// Adds all required dependencies and dev_dependencies to pubspec.yaml.
void addDependencies() {
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    print('pubspec.yaml not found!');
    return;
  }

  final dependencies = _getBaseDependencies();
  final stateHelper = chooseStateHelper();

  final lines = pubspecFile.readAsLinesSync();
  final depIndex = _findSectionIndex(lines, 'dependencies:');
  final devDepIndex = _findSectionIndex(lines, 'dev_dependencies:');

  if (depIndex == -1 || devDepIndex == -1) {
    print('dependencies or dev_dependencies section not found in pubspec.yaml!');
    return;
  }

  final newLines = List<String>.from(lines);

  _insertDependencies(newLines, depIndex, dependencies);
  _insertDependencies(newLines, depIndex, stateHelper.dependencies);
  _insertDependencies(newLines, devDepIndex, stateHelper.devDependencies);

  pubspecFile.writeAsStringSync(newLines.join('\n'));
  print('\n✅ Dependencies have been added to pubspec.yaml.');
}

List<String> _getBaseDependencies() {
  return [
    'bloc:',
    'flutter_bloc:',
    'go_router:',
    'dartz:',
  ];
}

int _findSectionIndex(List<String> lines, String section) {
  return lines.indexWhere((line) => line.trim() == section);
}

void _insertDependencies(List<String> lines, int sectionIndex, List<String> dependencies) {
  for (final dep in dependencies) {
    if (!_dependencyExists(lines, dep)) {
      lines.insert(sectionIndex + 1, '  $dep');
    }
  }
}

bool _dependencyExists(List<String> lines, String dep) {
  final depName = dep.split(':').first;
  return lines.any((l) => l.trim().startsWith('$depName:'));
}
