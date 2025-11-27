import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

BigInt factorial(int n) {
  BigInt result = BigInt.one;
  for (int i = 1; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

class FactorialPage extends StatefulWidget {
  @override
  _FactorialPageState createState() => _FactorialPageState();
}

class _FactorialPageState extends State<FactorialPage> {
  bool loading = false;
  String result = "";
  TextEditingController numberCtrl = TextEditingController();

  void calc() async {
    if (numberCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❗Hãy nhập số cần tính")),
      );
      return;
    }

    int? n = int.tryParse(numberCtrl.text);
    if (n == null || n < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚠ Giá trị không hợp lệ")),
      );
      return;
    }

    setState(() => loading = true);

    BigInt out = await compute(factorial, n);

    setState(() {
      loading = false;
      result = out.toString().length > 200
          ? out.toString().substring(0, 200) + "..."
          : out.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Isolate Factorial")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numberCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Nhập số cần tính giai thừa",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            loading
                ? CircularProgressIndicator()
                : Text(
              result.isEmpty ? "Chưa có kết quả" : result,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calc,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
