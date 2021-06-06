import 'package:frontend/models/env-config.dart';

class Environment {
  static const String CONFIG =
      String.fromEnvironment('CONFIG', defaultValue: 'tech');
  static EnvConfig _config = EnvConfig(
    dev: CONFIG == "dev",
    tech: CONFIG == "tech",
  );
  EnvConfig getConfig() => _config;

  static bool isConfigMatched(EnvConfig? input) {
    if (input == null) return false;

    EnvConfig newInput = input as EnvConfig;

    if (_config.dev) {
      return newInput.dev;
    } else if (_config.tech) {
      return newInput.tech;
    }
    return false;
  }
}
