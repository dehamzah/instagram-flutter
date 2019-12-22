import 'package:instagram_flutter/core/config.dart';

class Main extends Config {
  final Env env = Env.dev;
  final String apiBaseUrl = 'http://192.168.43.98:3000';
}

void main() {
  Main();
}
