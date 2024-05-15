import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.people, color: Colors.black), // People icon
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text(
                          'Requests',
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.comment,
                            color: Colors.black), // Comment icon
                        SizedBox(
                            width: 8), // Add some space between icon and text
                        Text(
                          'Comments',
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            RequestTab(),
            CommentTab(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class RequestTab extends StatelessWidget {
  const RequestTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this with actual data
    List<NotificationItem> requestNotifications = [
      NotificationItem(
          'Megan Clark', 'assets/images/person1.jpg', '2023-01-15'),
      NotificationItem(
          'Erick Martin', 'assets/images/person2.jpg', '2023-01-15'),
      NotificationItem(
          'Katie Smith', 'assets/images/person3.jpg', '2023-01-14'),
    ];

    return ListView.builder(
      itemCount: requestNotifications.length,
      itemBuilder: (BuildContext context, int index) {
        NotificationItem notification = requestNotifications[index];

        // Check if a separator is needed based on the date
        bool showDateSeparator = index == 0 ||
            notification.date != requestNotifications[index - 1].date;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDateSeparator)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(notification.date),
                ),
              ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(notification.profilePicture),
              ),
              title: Text(notification.name),
              subtitle: const Text(
                'sent you a friend request',
                softWrap: false, // Prevent text from wrapping
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle accept button
                      print('Accept friend request from ${notification.name}');
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 8.0), // Smaller values
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size(0, 0)), // Make button smaller
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              6.0), // Adjust corner radius
                        ),
                      ),
                    ),
                    child: const Text('Accept', style: TextStyle(fontSize: 12.0)),
                  ),
                  const SizedBox(width: 10), // Add some space between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Handle delete button
                      print('Delete friend request from ${notification.name}');
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 8.0), // Smaller values
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size(0, 0)), // Make button smaller
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade300),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              6.0), // Adjust corner radius
                        ),
                      ),
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CommentTab extends StatelessWidget {
  const CommentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual comment data
    List<NotificationItem> commentNotifications = [
      NotificationItem(
          'Fergus Duncan', 'assets/images/person4.jpg', '2023-01-15'),
      NotificationItem(
          'Hannah Bennett', 'assets/images/person5.jpg', '2023-01-15'),
      NotificationItem(
          'Megan Clark', 'assets/images/person5.jpg', '2023-01-14'),
      // Add more comments as needed
    ];

    return ListView.builder(
      itemCount: commentNotifications.length,
      itemBuilder: (BuildContext context, int index) {
        NotificationItem notification = commentNotifications[index];

        // Check if a separator is needed based on the date
        bool showDateSeparator = index == 0 ||
            notification.date != commentNotifications[index - 1].date;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDateSeparator)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(notification.date),
                ),
              ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(notification.profilePicture),
              ),
              title: Text(notification.name),
              subtitle: const Text('commented on your post'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                //lead to actual post
              },
            ),
          ],
        );
      },
    );
  }
}

class NotificationItem {
  final String name;
  final String profilePicture;
  final String date;

  NotificationItem(this.name, this.profilePicture, this.date);
}

void main() {
  runApp(const MaterialApp(
    home: NotificationPage(),
  ));
}
