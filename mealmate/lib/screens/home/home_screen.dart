import 'package:flutter/material.dart';
import 'package:mealmate/constants.dart';
import 'package:mealmate/screens/chat/chat_screen.dart';
import 'package:mealmate/screens/home/widgets/budget_dialog.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home_screen";
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController budgetController;

  @override
  void initState() {
    super.initState();
    budgetController = TextEditingController();
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Text(
                  "Just one Step Away!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Budget",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  final selectedValue = await showDialog(
                    context: context,
                    builder: (context) {
                      return BudgetDialogWidget(size: size);
                    },
                  );

                  setState(() {
                    budgetController.text =
                        selectedValue ?? 'Please select a budget';
                  });
                },
                child: TextField(
                  enabled: false,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  controller: budgetController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Please select a budget',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Region",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                // width: size.width * 0.8,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Enter region'),
                  items: <String>[
                    'Asia',
                    'Africa',
                    'Europe',
                    'America',
                    'Antarctica',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? "Select a country" : null,
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 48),
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
