import 'package:flutter/material.dart';

import '../../common/constants/images.dart';
import './auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      ///ini yang di tambahkan
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthPage(),

          ///jangan lupa di import AuthPage
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,

          ///bagian ini jika Images garis merah import dulu
          width: 150.0,
        ),
      ),
    );
  }
}
