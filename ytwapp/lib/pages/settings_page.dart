import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/edit_profile_page.dart';
import 'package:YourTunesWorld/pages/login_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isLocationSharingEnabled = false;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            buildElevatedButton('Edit Profile', Icons.edit, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
            }),
            const SizedBox(height: 30),
            buildLocationSharingButton(),
            const SizedBox(height: 30),
            buildElevatedButton('Sync with Facebook', Icons.sync, () {
              // Handle Sync with Facebook button press
            }),
            const SizedBox(height: 30),
            buildDarkModeButton(),
            const SizedBox(height: 30),
            buildElevatedButton('Hibernate Account', Icons.account_circle, () {
              // Show confirmation dialog for hibernating account
              _showConfirmationDialog();
            }),
            const SizedBox(height: 30),
            buildElevatedButton('Logout', Icons.exit_to_app, () {
              // Navigate to login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(
      String label, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[200],
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget buildLocationSharingButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle location sharing button press
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[200],
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                SizedBox(width: 50),
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Text('Location Sharing'),
              ],
            ),
            Switch(
              value: isLocationSharingEnabled,
              onChanged: (value) {
                setState(() {
                  isLocationSharingEnabled = value;
                });
                // Add your action when toggle button changes state here
              },
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDarkModeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle dark mode button press
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[200],
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                SizedBox(width: 75),
                Icon(Icons.brightness_4),
                SizedBox(width: 10),
                Text('Dark Mode'),
              ],
            ),
            Switch(
              value: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
                // Add your action when toggle button changes state here
              },
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to hibernate your account?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes, Hibernate'),
              onPressed: () {
                // Add your logic to hibernate the account here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
