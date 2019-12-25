import 'package:flutter/cupertino.dart';
import 'app.dart';

enum Env { dev, staging, production }

class Config {
  static Config value;

  Env env;
  String apiBaseUrl;
  bool enableNetworkLogging;

  Config() {
    value = this;
    this._init();
  }

  void _init() {
    runApp(App());
  }
}
