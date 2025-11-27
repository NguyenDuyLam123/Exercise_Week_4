import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

BigInt factorial(int n) {
  BigInt result = BigInt.one;
  for (int i = 1; i <= n; i++) result *= BigInt.from(i);
  return result;
}

class FactorialPage extends StatefulWidget {
  @override
  _FactorialPageState createState() => _FactorialPageState();
}

class _FactorialPageState extends State<FactorialPage> {
  bool loading = false;
  String result = "";

  void calc() async {
    setState(()=>loading=true);
    BigInt out = await compute(factorial, 30000);
    setState(() {
      loading=false;
      result = out.toString().substring(0,200)+"...";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Isolate Factorial")),
      body: Center(
        child: loading ? CircularProgressIndicator() : Text(result.isEmpty ? "Press to start" : result),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calc,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
