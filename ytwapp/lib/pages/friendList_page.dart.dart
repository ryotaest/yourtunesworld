import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/friend_detail_page.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final List<Map<String, dynamic>> allFriends = [
    {'name': 'Megan Clark', 'profilePicture': 'assets/images/person1.jpg'},
    {'name': 'Erick Martin', 'profilePicture': 'assets/images/person2.jpg'},
    {'name': 'Katie Smith', 'profilePicture': 'assets/images/person3.jpg'},
    {'name': 'Fergus Duncan', 'profilePicture': 'assets/images/person4.jpg'},
    {'name': 'Hannah Bennett', 'profilePicture': 'assets/images/person5.jpg'},
  ];

  List<Map<String, dynamic>> filteredFriends = [];

  @override
  void initState() {
    super.initState();
    filteredFriends = List.from(allFriends);
  }

  void filterFriends(String query) {
    setState(() {
      filteredFriends = allFriends
          .where((friend) =>
              friend['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend List', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterFriends,
              decoration: InputDecoration(
                hintText: 'Search friends...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFriends.length,
              itemBuilder: (BuildContext context, int index) {
                final String friendName = filteredFriends[index]['name'];
                final String profilePicture =
                    filteredFriends[index]['profilePicture'];

                return InkWell(
                  onTap: () {
                    if (friendName == 'Megan Clark') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendPage(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(profilePicture),
                        radius: 25.0,
                      ),
                      title: Text(friendName),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Handle remove button click
                          print('Remove $friendName');
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey.shade300),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))),
                        child: const Text('Remove'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
