import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefPage extends StatefulWidget {
  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {
  TextEditingController nameCtrl = TextEditingController();
  String display = "";

  void saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", nameCtrl.text);
    setState(() => display = "Saved!");
  }

  void showName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("username");
    setState(() => display = name ?? "No data found");
  }

  void clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    setState(() => display = "Cleared!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared Preferences")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Enter name")),
            ElevatedButton(onPressed: saveName, child: Text("Save Name")),
            ElevatedButton(onPressed: showName, child: Text("Show Name")),
            ElevatedButton(onPressed: clearData, child: Text("Clear")),
            SizedBox(height: 20),
            Text(display),
          ],
        ),
      ),
    );
  }
}
