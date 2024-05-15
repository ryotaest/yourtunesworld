// splash_page.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/login_page.dart';

// Import statements remain the same

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double logoHeight = 100.0; // Initial height of the logo

  @override
  void initState() {
    super.initState();

    // Start the animation after a short delay
    Timer(const Duration(milliseconds: 1100), () {
      // Increase the height of the logo during a certain duration
      setState(() {
        logoHeight = 300.0; // Adjust this value based on your design
      });
    });

    // Add a delay to simulate a loading process
    Timer(const Duration(seconds: 2), () {
      // Navigate to the home page after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500), // Animation duration
              height: logoHeight,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your Tunes World',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.apple, size: 55),
                const SizedBox(width: 16),
                const Icon(Icons.facebook, size: 50),
                const SizedBox(width: 17),
                Image.asset('assets/images/spotify.png', height: 40),
                const SizedBox(width: 16),
                Image.asset('assets/images/bandsintownlogo.jpg', height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
