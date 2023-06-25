import 'package:flutter/material.dart';
import 'package:mealmate/constants.dart';
import 'package:mealmate/screens/chat/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home_screen";
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? selectedValue;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              // add an image here
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Just one Step Away!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Spacer(),
              
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Budget",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)
                       ), 
                      hintText: 'Enter amount'
                      ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Allergies",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)
                      ), hintText: 'Enter allergies'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Region",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(20)
                      ), hintText: 'Enter region'),
                  items: <String>[
                    'Africa', 
                    'Antarctica',
                    'Asia',
                    'Europe',
                    'North America', 
                    'Oceania',
                    'South America'
                    ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                    validator: (value) => value == null ? "Select a country" : null,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                      selectedValue = newValue!;
                    });
                    },
                  ),
                )
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                  child: const Text("Submit"),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
