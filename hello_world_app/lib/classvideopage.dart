import 'package:flutter/material.dart';

class ClassVideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Class Video",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Image Placeholder
            Container(
              color: Colors.grey[200],
              height: 200,
              child: Center(
                child: Icon(Icons.play_circle_outline, size: 64, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            
            // Equipment Tags
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(label: Text("Exercise Ball")),
                Chip(label: Text("2 x Fusion Balls")),
                Chip(label: Text("Yoga Mat")),
              ],
            ),
            SizedBox(height: 16),
            
            // Video description and preparation text
            Text(
              "23 minutes - Equipment Used",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The video for this class runs for 23 minutes, but we recommend setting aside 35-40 minutes to fully engage with the session. This additional time allows you to comfortably repeat exercises as needed.",
            ),
            SizedBox(height: 16),
            Text(
              "This session is crafted to introduce young dancers to the core elements of ballet technique...",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
