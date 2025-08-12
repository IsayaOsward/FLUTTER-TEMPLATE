import 'dart:io';

import 'package:flutter/material.dart';

class DeviceUnsafeApp extends StatelessWidget {
  const DeviceUnsafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      exit(0);
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64.0,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Device Unsafe',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'This app cannot run on rooted or emulated devices, or with developer options enabled.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Please use a physical device without root access and ensure developer options are disabled to use this app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// TODO: aDD A message we believe security is important for but not for compromizing apps in production and make the page more beautiful