import 'package:flutter/material.dart';
import 'package:YourTunesWorld/home_page.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Define controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 247, 255),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Create Account',
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 194, 247, 255),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text Fields

              buildTextField(_firstNameController, 'First Name'),

              buildTextField(_lastNameController, 'Last Name'),

              buildTextField(_emailController, 'Email',
                  keyboardType: TextInputType.emailAddress),

              buildTextField(_passwordController, 'Password',
                  obscureText: true),

              buildTextField(_confirmPasswordController, 'Confirm Password',
                  obscureText: true),

              buildDateOfBirthTextField(_dobController, 'Date of Birth'),

              // buildTextField(_genderController, 'Gender'),
              Container(
                height: 60,
                margin: const EdgeInsets.only(bottom: 12),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _genderController.text.isNotEmpty
                          ? _genderController.text
                          : null,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 12,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _genderController.text = newValue!;
                        });
                      },
                      items: <String>['Male', 'Female', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      _countryController,
                      'Country',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildTextField(
                      _cityController,
                      'City',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Save Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // Set text color to black
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  // Handle Save button press
                  // You can access the entered values using the controllers
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String confirmPassword = _confirmPasswordController.text;
                  String dob = _dobController.text;
                  String gender = _genderController.text;
                  String country = _countryController.text;
                  String city = _cityController.text;

                  // Add logic to save the user data
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label,
      {TextInputType? keyboardType, bool obscureText = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }

  Widget buildDateOfBirthTextField(
      TextEditingController controller, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            String formattedDate = DateFormat('dd/MM/yy').format(pickedDate);
            controller.text = formattedDate;
          }
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RegisterPage(),
  ));
}
