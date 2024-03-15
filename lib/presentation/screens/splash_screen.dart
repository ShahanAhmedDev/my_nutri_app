import 'package:flutter/material.dart';
import 'package:my_nutri_app/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigationPage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      left: false,
      right: true,
      child: Scaffold(
        body: Image.asset('images/splash_image.jpeg'),
      ),
    );
  }
}
