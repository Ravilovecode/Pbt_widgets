import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Title, Artist, Genre...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Recently Played Section
            Text(
              'Recently played',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/recently_played1.jpeg'),
                radius: 25,
              ),
              title: Text('Zombies'),
              subtitle: Text('Artist name'),
              trailing: Icon(Icons.favorite_border),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/recently_played2.jpeg'),
                radius: 25,
              ),
              title: Text('Song name'),
              subtitle: Text('Artist name'),
              trailing: Icon(Icons.favorite_border),
            ),
            Divider(),
            // Add more recently played songs
          ],
        ),
      ),
    );
  }
}
