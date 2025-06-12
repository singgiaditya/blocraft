/// State management helper selection for Blocraft CLI.
///
/// Provides a class and function to handle user choice between equatable and freezed.
library state_helper;

import 'dart:io';

/// Represents the user's choice for state management helper dependencies.
class StateHelperChoice {
  final List<String> dependencies;
  final List<String> devDependencies;

  StateHelperChoice({
    required this.dependencies,
    required this.devDependencies,
  });
}

/// Prompts the user to choose a state management helper and returns the corresponding dependencies.
StateHelperChoice chooseStateHelper() {
  stdout.write(
    'Choose state management helper:\n'
    '1. equatable\n'
    '2. freezed\n'
    'Enter your choice (1 or 2): '
  );
  final choice = stdin.readLineSync();
  if (choice == '2') {
    return StateHelperChoice(
      dependencies: [
        'freezed_annotation:',
      ],
      devDependencies: [
        'freezed:',
        'build_runner:',
      ],
    );
  }
  return StateHelperChoice(
    dependencies: [
      'equatable:',
    ],
    devDependencies: [],
  );
}
