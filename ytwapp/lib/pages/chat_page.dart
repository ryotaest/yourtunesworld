import 'package:flutter/material.dart';
import 'package:YourTunesWorld/pages/global_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [];
  TextEditingController messageController = TextEditingController();

  void sendMessage(String message) {
    setState(() {
      messages.add(Message(isMe: true, text: message));
    });
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White background
        elevation: 0.0, // No elevation
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Global()),
              );
            },
          ),
        ),

        title: const Text(
          'Chat with Friend',
          style: TextStyle(color: Colors.black), // Black text color
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(Icons.group, color: Colors.black),
              onPressed: () {
                // Handle Members button press
                // Navigate to the page showing the participants in the chat
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(messages[index]);
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30.0),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (messageController.text.isNotEmpty) {
                        sendMessage(messageController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final bool isMe;
  final String text;

  Message({required this.isMe, required this.text});
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
