import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_theme_example/services/app_theme_notifier.dart';
import 'package:reactive_theme_example/services/app_theme_provider.dart';
import 'package:reactive_theme_example/ui/home_page_widget.dart';

class ReactiveThemesApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _appThemeState = watch(appThemeStateProvider);
    return MaterialApp(
      theme: context.read(appThemeProvider).getAppThemedata(context, _appThemeState),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}