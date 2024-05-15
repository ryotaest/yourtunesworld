import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/chat_page.dart';
import 'package:YourTunesWorld/pages/find_group.dart';

class Global extends StatefulWidget {
  const Global({Key? key}) : super(key: key);

  @override
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  TextEditingController musicController = TextEditingController();
  String selectedMusic = '';

  void _showCreateNewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      ),
                      const Text(
                        'Create Group',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 40), // Adjust the spacing as needed
                    ],
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Group Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: musicController,
                          decoration: InputDecoration(
                            hintText: 'Select Your Tune',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.music_note),
                              onPressed: () {
                                _showMusicListDialog(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      minimumSize: const Size(150, 55),
                    ),
                    child: const Text('Start'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showMusicListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Your Tune'),
          content: Column(
            children: [
              _buildMusicListItem(context, 'Song 1'),
              _buildMusicListItem(context, 'Song 2'),
              _buildMusicListItem(context, 'Song 3'),
              // actual music from the profile
            ],
          ),
        );
      },
    );
  }

  Widget _buildMusicListItem(BuildContext context, String musicName) {
    return ListTile(
      title: Text(musicName),
      onTap: () {
        setState(() {
          selectedMusic = musicName;
          musicController.text = selectedMusic;
        });
        // Handle music item selection
        Navigator.pop(context); // Close the dialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Chat', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _showCreateNewBottomSheet(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Text('Create New',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 70.0), // Increased space between buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('or', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            const SizedBox(height: 70.0), // Increased space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FindGroup()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Text('Find Group',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Download tunes to talk with people from the world!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Global(),
  ));
}
