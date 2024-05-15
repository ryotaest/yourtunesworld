import 'package:flutter/material.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({Key? key}) : super(key: key);

  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White background
        elevation: 0.0, // No elevation
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Black icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black), // Black text color
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              minWidth: 10,
              color: Colors.blue,
              onPressed: () {},
              child: const Text('POST',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/person4.jpg'),
                ),
                SizedBox(width: 16),
                Text(
                  'Fergus Duncan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'What\'s on your mind?',
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.photo, color: Colors.black),
                            onPressed: () {
                              // Add logic for handling photo selection
                            },
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.emoji_emotions, color: Colors.black),
                            onPressed: () {
                              // Add logic for handling emoji selection
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.videocam, color: Colors.black),
                            onPressed: () {
                              // Add logic for handling video selection
                            },
                          ),
                        ],
                      ),
                    ],
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
