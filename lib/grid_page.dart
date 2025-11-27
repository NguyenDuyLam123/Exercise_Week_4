import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView Exercise")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text("Fixed Column Grid", style: TextStyle(fontSize: 20)),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              children: List.generate(12, (i) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.image),
                    ),
                    Text("Item ${i+1}")
                  ],
                );
              }),
            ),

            SizedBox(height: 20),
            Text("Responsive Grid", style: TextStyle(fontSize: 20)),
            GridView.extent(
              maxCrossAxisExtent: 150,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: List.generate(12, (i) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.photo),
                    ),
                    Text("Item ${i+1}")
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
