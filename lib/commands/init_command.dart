/// Provides the entry point for initializing the project structure and dependencies.
///
/// This command will create the recommended folder structure and inject essential dependencies
/// into pubspec.yaml, including a user choice for state management helper (equatable or freezed).
library init_command;

import 'project_structure.dart';
import 'dependency_manager.dart';

/// Initializes the project structure and injects dependencies.
void runInitCommand() {
  createProjectStructure();
  addDependencies();
  print('\n✅ The project initialization structure has been successfully created.');
}
