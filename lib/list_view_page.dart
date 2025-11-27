import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  final List<String> contacts = List.generate(20, (i) => "Contact ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (_, index) {
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(contacts[index]),
          );
        },
      ),
    );
  }
}
