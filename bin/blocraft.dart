import 'package:blocraft/commands/feature_command.dart';
import 'package:blocraft/commands/init_command.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    _printHelp();
    return;
  }

  final command = arguments[0];

  switch (command) {
    case 'init':
      runInitCommand();
      break;
    case 'feature':
      if (arguments.length < 2) {
        print('❌ Please enter the feature name.');
        return;
      }
      final featureName = arguments[1];
      runFeatureCommand(featureName);
      break;
    default:
      print('❌ Unrecognized command: $command');
      _printHelp();
  }
}

void _printHelp() {
  print('🧱 blocraft CLI - Flutter Clean Architecture Scaffold');
  print('');
  print('Usage:');
  print('  blocraft init');
  print('    → Create Structure core/shared/features');
  print('');
  print('  blocraft feature <feature_name>');
  print('    → Generate folder for a specific feature.');
}
