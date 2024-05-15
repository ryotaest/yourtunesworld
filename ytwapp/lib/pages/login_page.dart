import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 194, 247, 255), // Set the background color to light blue
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120), // Add space at the top
            const Center(
              child: Text(
                'WELCOME TO YOUR TUNES WORLD',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Replace with the actual path to your logo
                height: 100,
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Login to your account',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white, // Set text color to black
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, size: 40), // Replace with the Apple icon
                  SizedBox(width: 10),
                  Text('Login with Apple Music'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'or',
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle Login with Spotify
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white, // Set text color to black
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/spotify.png',
                    height: 30,
                  ),
                  const SizedBox(width: 15),
                  const Text('Login with Spotify'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}
