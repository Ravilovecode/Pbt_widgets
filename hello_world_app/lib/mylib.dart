import 'package:flutter/material.dart';

class MyLibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Library'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Library Playlists Section
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.pink, size: 40),
              title: Text('Favourites'),
              subtitle: Text('Playlist • 10 songs'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/playlist_image1.jpeg'),
                radius: 25,
              ),
              title: Text('Playlist name'),
              subtitle: Text('Playlist • 14 songs'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/dance.jpeg'),
                radius: 25,
              ),
              title: Text('Playlist name'),
              subtitle: Text('Playlist • 14 songs'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add, color: Colors.grey, size: 40),
              title: Text('New Playlist'),
              subtitle: Text('Create your Playlist'),
            ),
          ],
        ),
      ),
    );
  }
}
