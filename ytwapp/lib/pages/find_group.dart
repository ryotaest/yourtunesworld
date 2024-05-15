// find_group.dart

import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/chat_page.dart';

class FindGroup extends StatelessWidget {
  const FindGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Group', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search groups...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),

            // Genre Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: const SizedBox(), // Remove the default underline
                value: 'Select Genre', // Set the default value
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Select Genre',
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Select Genre'),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Rock',
                    child: Text('Rock'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Pop',
                    child: Text('Pop'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Hip Hop',
                    child: Text('Hip Hop'),
                  ),
                  // Add more genres as needed
                ],
                onChanged: (value) {
                  // Handle genre selection
                },
              ),
            ),
            const SizedBox(height: 16.0),

            // List of Ongoing Live Chats
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Number of groups
                itemBuilder: (context, index) {
                  // Replace the following with your actual data for each group
                  String hostProfilePictureUrl = '';
                  String groupTitle = '';
                  int numberOfMembers = 0;
                  String musicTitle = '';

                  // Assign actual details based on the group index
                  if (index == 0) {
                    hostProfilePictureUrl =
                        'assets/images/person5.jpg'; // Replace with actual URL
                    groupTitle = 'Global chat and chill';
                    numberOfMembers = 9;
                    musicTitle = 'A&W - Lana Del Rey';
                  } else if (index == 1) {
                    hostProfilePictureUrl =
                        'assets/images/person2.jpg'; // Replace with actual URL
                    groupTitle = 'Good Vibes';
                    numberOfMembers = 2;
                    musicTitle = 'Fireflies - Owl City';
                  } else if (index == 2) {
                    hostProfilePictureUrl =
                        'assets/images/person1.jpg'; // Replace with actual URL
                    groupTitle = "TGIF let's talk!";
                    numberOfMembers = 5;
                    musicTitle = 'Dance The Night - Dua Lipa';
                  }

                  return OngoingLiveChatItem(
                    hostProfilePicture: hostProfilePictureUrl,
                    groupTitle: groupTitle,
                    numberOfMembers: numberOfMembers,
                    musicTitle: musicTitle,
                    onPressedDownload: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatPage()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OngoingLiveChatItem extends StatelessWidget {
  final String hostProfilePicture;
  final String groupTitle;
  final int numberOfMembers;
  final String musicTitle;
  final VoidCallback onPressedDownload;

  const OngoingLiveChatItem({
    super.key,
    required this.hostProfilePicture,
    required this.groupTitle,
    required this.numberOfMembers,
    required this.musicTitle,
    required this.onPressedDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(hostProfilePicture),
            radius: 30.0,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  groupTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$numberOfMembers members'),
                Text(musicTitle),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: onPressedDownload,
            icon: const Icon(Icons.download,
                color: Colors.white), // Set icon color
            label:
                const Text('Download', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Set background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Border radius
              ),
            ),
          ),
        ],
      ),
    );
  }
}
