import 'package:flutter/material.dart';
import 'package:hello_world_app/classvideopage.dart';

class ExerciseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
        title: Text(
          '1. Exercise Name',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Image.asset('assets/home/chill.jpeg', height: 200, fit: BoxFit.cover),
            SizedBox(height: 8),
            
            // Equipment tags
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(label: Text("Exercise Ball")),
                Chip(label: Text("2 x Fusion Balls")),
                Chip(label: Text("Yoga Mat")),
              ],
            ),
            SizedBox(height: 16),
            
            // Preparation Section
            Text(
              "Preparation:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("• Lie on a mat with the fusion ball between the upper calves."),
            Text("• Keep legs bent with feet flat in parallel."),
            Text("• Arms should rest comfortably at the sides."),
            SizedBox(height: 16),
            
            // Audio Player UI
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFFCE4EC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text("1. Exercise Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Song Title\nComposer", style: TextStyle(fontSize: 16, color: Colors.grey)),
                  Slider(
                    value: 17.0,
                    min: 0,
                    max: 30.0,
                    onChanged: (value) {},
                    activeColor: Color(0xFFE91E63),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Slow"),
                      IconButton(icon: Icon(Icons.fast_rewind), onPressed: () {}),
                      IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
                      IconButton(icon: Icon(Icons.fast_forward), onPressed: () {}),
                      Text("Fast"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            
            // Button to navigate to full class video page
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClassVideoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE91E63)),
                child: Text("Full Class Video"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
