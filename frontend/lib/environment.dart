import 'package:frontend/models/config.dart';

class Environment {
  static const String CONFIG =
      String.fromEnvironment('CONFIG', defaultValue: 'tech');
  static Config _config = Config(
    dev: CONFIG == "dev",
    tech: CONFIG == "tech",
  );
  Config getConfig() => _config;

  static bool isConfigMatched(Config? input) {
    if (input == null) return false;

    Config newInput = input as Config;

    if (_config.dev) {
      return newInput.dev;
    } else if (_config.tech) {
      return newInput.tech;
    }
    return false;
  }
}
