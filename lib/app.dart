import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'core/routes/app_router.dart';
import 'core/theme/controllers/theme_controller_provider.dart';
import 'core/theme/theme_modes/dark_theme.dart';
import 'core/theme/theme_modes/light_theme.dart';
import 'shared/utils/dimensions.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final themeController = context.watch<ThemeController>();
    return ToastificationWrapper(
      config: ToastificationConfig(
        maxTitleLines: 1,
        maxDescriptionLines: 2,
        maxToastLimit: 1,
        animationDuration: Duration(seconds: 3),
      ),
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeController.appThemeMode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
