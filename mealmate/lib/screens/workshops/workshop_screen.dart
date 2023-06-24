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
  List<Map<String, String>> workshopNames = [
    {
      'image': 'assets/images/awareness_training.png',
      'text': 'Awareness Training',
      'description': 'Learn about food insecurity and how to help'
    },
    {
      'image': 'assets/images/food_wastage.png',
      'text': 'Food Wastage',
      'description': 'Learn about food wastage and how to help'
    },
    {
      'image': 'assets/images/team_brainstorming.png',
      'text': 'Team Brainstorming',
      'description': 'Learn about food insecurity and how to help'
    },
    {
      'image': 'assets/images/food_insecurity_hackathon.png',
      'text': 'Food Insecurity Hackathon',
      'description': 'Learn about food insecurity and how to help'
    },
    {
      'image': 'assets/images/food_togetherness.png',
      'text': 'Food Togetherness Meet',
      'description': 'Learn about food insecurity and how to help'
    },
    {
      'image': 'assets/images/food_samples.png',
      'text': 'Sharing is Caring',
      'description': 'Learn about food insecurity and how to help'
    },
    {
      'image': 'assets/images/food_cart.png',
      'text': 'Buying Healthy & Affordable Foods',
      'description': 'Learn about food insecurity and how to help'
    },
    {
      'image': 'assets/images/food_logo.png',
      'text': 'Food Insecurity Awareness',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workshops"),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                workshopNames[index % 8]['image']!,
                width: 50,
                height: 50,
              ),
              title: Text(workshopNames[index % 8]['text']!),
              subtitle: const Text("Date: 12/12/2023"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()))
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
