import 'package:instagram_flutter/core/config.dart';

class MainProduction extends Config {
  final Env env = Env.production;
  final String apiBaseUrl = 'http://localhost:3000';
}

void main() => MainProduction();
