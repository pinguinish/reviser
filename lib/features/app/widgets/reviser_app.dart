import "package:flutter/material.dart";
import "package:reviser/core/theme/color_theme_extension.dart";
import "package:reviser/core/theme/reviser_app_theme.dart";
import "package:reviser/core/utils/screen_util.dart";

class ReviserApp extends StatelessWidget {
  const ReviserApp({super.key});

  @override
  Widget build(BuildContext context) => context.adaptByDeviceType(
        small: (_) => ScreenUtil.responsiveMaterialApp(
          child: const HomeScreen(),
          theme: ReviserAppTheme.lightTheme.applyAllExtension(),
        ),
        medium: (_) => ScreenUtil.responsiveMaterialApp(
          child: const HomeScreen(),
          theme: ReviserAppTheme.lightTheme.applyAllExtension(),
        ),
        large: (_) => ScreenUtil.responsiveMaterialApp(
          child: const HomeScreen(),
          theme: ReviserAppTheme.lightTheme.applyAllExtension(),
        ),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello, World"),
      ),
    );
  }
}
