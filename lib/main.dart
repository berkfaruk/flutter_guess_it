import 'package:flutter/material.dart';
import 'package:flutter_guess_it/core/get_it/get_it.dart';
import 'package:flutter_guess_it/core/router/app_router.dart';
import 'package:flutter_guess_it/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: AppRouter.router,
    theme: AppTheme.getTheme(),
  ));
}
