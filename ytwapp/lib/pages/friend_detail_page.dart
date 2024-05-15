import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/post_detail_page.dart';
import 'package:YourTunesWorld/pages/my_page.dart';

class FriendPage extends StatelessWidget {
  final String profileImage = 'assets/images/person1.jpg';
  final String userName = 'Megan Clark';
  final List<String> favoriteSongs = [
    'Dance The Night - Dua Lipa',
    'Flowers - Miley Cyrus',
    'A&W - Lana Del Rey',
  ];

  final List<Post> posts = [
    Post(
      userName: 'Megan Clark',
      profileImage: 'assets/images/person1.jpg',
      dateTime: '2 days ago',
      content:
          'Post 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      postImage: 'assets/images/bandsintown4.png',
    ),
    Post(
      userName: 'Megan Clark',
      profileImage: 'assets/images/person1.jpg',
      dateTime: '5 days ago',
      content:
          'Post 2: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      postImage: null,
    ),
    Post(
      userName: 'Megan Clark',
      profileImage: 'assets/images/person1.jpg',
      dateTime: '1 week ago',
      content:
          'Post 3: Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      postImage: null,
    ),
  ];

  FriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Megan Clark', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profileImage),
            ),
            const SizedBox(height: 20),
            const Text(
              "Megan's Tunes:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: favoriteSongs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: Row(
                  children: [
                    Text(
                      '${index + 1}. ${favoriteSongs[index]}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (index == 0) {
                          print('Request ${favoriteSongs[index]}');
                        } else {
                          print('Download ${favoriteSongs[index]}');
                        }
                        // Handle download button click
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            index == 0 ? Colors.green : Colors.blue,
                        elevation: 0, // No shadow
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                      ),
                      child: Text(index == 0 ? 'Request' : 'Download'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Posts:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: posts
                  .take(3) // Display only the first 3 posts
                  .map((post) => PostWidget(post: post))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.grey, // Border color
          width: 1.0,
        ),
      ),
      child: ListTile(
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(post.profileImage),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.userName),
                Text(
                  post.dateTime,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              post.content,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            post.postImage != null
                ? Image.asset(
                    post.postImage!,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  // Add logic for handling comments
                },
                child: const Text(
                  'Comment',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.all(8),
        isThreeLine: true,
        dense: true,
        subtitleTextStyle: const TextStyle(fontSize: 12),
        tileColor: Colors.white, // White background
        visualDensity: VisualDensity.compact,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailPage(post: post),
            ),
          );
        },
      ),
    );
  }
}
