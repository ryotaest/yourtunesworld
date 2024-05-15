import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/my_page.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.userName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              post.dateTime,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (post.postImage != null)
              Image.asset(
                post.postImage!,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add logic for handling comments
                },
                child: const Text(
                  'Comment',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
