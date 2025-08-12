import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'core/injection/injection_container.dart' as di;
import 'shared/device_unsafe.dart';
import 'shared/providers_list.dart';
import 'shared/utils/helper_methods/device_security_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  di.setup();

  final shouldBypass = dotenv.env['BYPASS_SECURITY']?.toLowerCase() == 'true';

  if (!shouldBypass) {
    final securityChecker = di.getIt<DeviceSecurityChecker>();
    final securityResult = await securityChecker.checkDeviceSecurity();

    if (!securityResult.isSecure) {
      runApp(const DeviceUnsafeApp());
      return;
    } else {
      runApplication();
    }
  } else {
    runApplication();
  }
}

dynamic runApplication() => runApp(multiProvider(child: AppWrapper()));
