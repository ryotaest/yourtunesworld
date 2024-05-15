import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  // Add logic for editing photo
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      'Edit Photo',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildTextField(_firstNameController, 'First Name'),
              buildTextField(_lastNameController, 'Last Name'),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Gender',
                    labelStyle: TextStyle(color: Colors.grey),
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
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  String firstName = _firstNameController.text;
                  String lastName = _lastNameController.text;
                  String gender = _genderController.text;
                  String country = _countryController.text;
                  String city = _cityController.text;
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
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
