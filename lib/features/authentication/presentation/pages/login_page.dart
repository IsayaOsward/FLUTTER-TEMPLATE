import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.nature1.image(),
      ),
    );
  }
}
