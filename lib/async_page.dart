import 'package:flutter/material.dart';

class AsyncPage extends StatefulWidget {
  @override
  _AsyncPageState createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  String message = "Loading user...";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() => message = "User loaded successfully!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Async Example")),
      body: Center(child: Text(message)),
    );
  }
}
