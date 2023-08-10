import 'dart:convert';

import 'package:cryptocurrency_app/models/app_config.dart';
import 'package:cryptocurrency_app/pages/home_page.dart';
import 'package:cryptocurrency_app/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHTTPService();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString("assets/config/main.json");
  Map _configData = jsonDecode(_configContent);
  // print(_configData); the print is to make sure the Api in main.json execute properly
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(
      COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"],
    ),
  );
}

void registerHTTPService() {
  GetIt.instance.registerSingleton<HTTPService>(HTTPService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cryptocurrency_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(160, 22, 56, 167),
      ),
      home: HomePage(),
    );
  }
}
