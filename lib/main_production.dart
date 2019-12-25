import 'package:instagram_flutter/core/config.dart';

class MainProduction extends Config {
  final Env env = Env.production;
  final String apiBaseUrl = 'https://instagram-fake-json.herokuapp.com';
  final bool enableNetworkLogging = false;
}

void main() => MainProduction();
