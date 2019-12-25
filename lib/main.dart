import 'package:instagram_flutter/core/config.dart';

class Main extends Config {
  final Env env = Env.dev;
  final String apiBaseUrl = 'https://instagram-fake-json.herokuapp.com';
  final bool enableNetworkLogging = true;
}

void main() {
  Main();
}
