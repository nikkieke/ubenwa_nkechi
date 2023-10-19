import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ubenwa_nkechi/app/app.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: App()));
}
