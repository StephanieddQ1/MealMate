import 'package:flutter/material.dart';
import 'package:mealmate/screens/home/home_screen.dart';
import 'package:mealmate/screens/chat/chat_screen.dart';

class WorkshopsScreen extends StatefulWidget {
  static const routeName = "/workshop_screen";
  const WorkshopsScreen({super.key});

  @override
  State<WorkshopsScreen> createState() => _WorkshopsScreenState();
}

class _WorkshopsScreenState extends State<WorkshopsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workshops"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
          if (value == 0)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()))
            }
          else if (value == 1)
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()))
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
      home: WorkshopsScreen(),
    );
  }
}
