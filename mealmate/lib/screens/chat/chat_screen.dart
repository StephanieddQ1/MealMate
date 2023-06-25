import 'package:flutter/material.dart';
import 'package:mealmate/screens/home/home_screen.dart';
import 'package:mealmate/screens/workshops/workshop_screen.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = "/chat_screen";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspaces),
            label: "Workshops",
          ),
        ],
        onTap: (value) => {
          if (value == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()))
          } else if (value == 2) {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WorkshopsScreen()))
          }
        },
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}


// integrating the backend goes here
