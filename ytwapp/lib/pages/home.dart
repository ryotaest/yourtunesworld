import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First Section
          Container(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              'assets/images/bandsintown1.png',
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Second Section
          Container(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              'assets/images/bandsintown2.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Popular in Sydney, Australia',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          // Third Section - Horizontally Scrollable
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/bandsintown3.png',
                      height: 300,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/bandsintown4.png',
                      height: 300,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
