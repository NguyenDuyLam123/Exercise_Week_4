import 'package:flutter/material.dart';
import 'list_view_page.dart';
import 'grid_page.dart';
import 'shared_pref_page.dart';
import 'async_page.dart';
import 'factorial_page1.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercise Week 4")),
      body: ListView(
        children: [
          ListTile(title: Text("1. ListView"), onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>ListViewPage()))),
          ListTile(title: Text("2. GridView"), onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>GridPage()))),
          ListTile(title: Text("3. Shared Preferences"), onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>SharedPrefPage()))),
          ListTile(title: Text("4. Async Programming"), onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>AsyncPage()))),
          ListTile(title: Text("5. Isolate Factorial 1"), onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>FactorialPage()))),
        ],
      ),
    );
  }
}
