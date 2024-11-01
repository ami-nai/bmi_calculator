import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _weightUnit = 'Kg'; // Default value for weight unit dropdown
  String _heightUnit = 'cm'; // Default value for height unit dropdown
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'), // Add a title for clarity
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the body
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20), // Adds spacing between elements
            Row(
              children: <Widget>[
                const SizedBox(width: 25),
                Expanded( // Changed to Expanded to handle overflow better
                  flex: 3,
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Weight",
                      hintText: "Weight",
                      prefixIcon: Icon(Icons.scale),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Adds space between TextField and Dropdown
                Expanded( // Changed to Expanded
                  flex: 1,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _weightUnit,
                    items: const [
                      DropdownMenuItem(value: "Kg", child: Text("Kg")),
                      DropdownMenuItem(value: "Lbs", child: Text("Lbs")),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _weightUnit = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                const SizedBox(width: 25),
                Expanded( // Changed to Expanded
                  flex: 3,
                  child: TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Height",
                      hintText: "Height",
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded( // Changed to Expanded
                  flex: 1,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _heightUnit,
                    items: const [
                      DropdownMenuItem(value: "cm", child: Text("cm")),
                      DropdownMenuItem(value: "meter", child: Text("meter")),
                      DropdownMenuItem(value: "feet", child: Text("feet")),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _heightUnit = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 20), // Spacing before button
            ElevatedButton(
              onPressed: () {
                try {
                  double weight = double.parse(weightController.text);
                  double height = double.parse(heightController.text);

                  if (_weightUnit == "Lbs") {
                    weight = weight * 0.453592; // Convert pounds to kilograms
                  }
                  if (_heightUnit == "cm") {
                    height = height / 100; // Convert cm to meters
                  } else if (_heightUnit == "feet") {
                    height *= 0.3048; // Convert feet to meters
                  }

                  double result = weight / (height * height);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Result(result: result.toStringAsFixed(2))));
                } catch (e) {
                  // Show an alert if the input is not valid
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Input Error"),
                        content: const Text("Please enter valid numeric values."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.greenAccent,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
