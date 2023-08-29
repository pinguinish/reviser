import "package:auto_route/annotations.dart";
import "package:flutter/material.dart";
import "package:reviser/core/theme/color_theme_extension.dart";
import "package:reviser/core/theme/reviser_app_theme.dart";
import "package:reviser/core/utils/screen_util.dart";
import "package:reviser/features/initialization/models/dependencies.dart";


class ReviserApp extends StatelessWidget {
  const ReviserApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        builder: (context, child) {
          final device = ScreenUtil.deviceTypeOf(View.of(context).display.size);
          final data = MediaQuery.of(context).copyWith(
            textScaleFactor: device.textScaleFactor,
          );
          return MediaQuery(
            data: data,
            child: child!,
          );
        },
        theme: ReviserAppTheme.lightTheme.copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ).applyAllExtension(),
        darkTheme: ReviserAppTheme.darkTheme.copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ).applyAllExtension(),
        routerConfig: Dependencies.of(context).router.config(),
      );

}
