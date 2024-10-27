import 'package:flutter/material.dart';
import 'package:hello_world_app/faqpage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Back button and profile section
          Container(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink[400],
                    child: Text(
                      'L',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    'Laurie',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),

          // Menu items
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            minLeadingWidth: 20,
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('My Account'),
            trailing: Icon(Icons.edit_outlined, color: Colors.pink[400]),
            minLeadingWidth: 20,
          ),
          ListTile(
            leading: Icon(Icons.play_circle_outline),
            title: Text('PBT Classes'),
            minLeadingWidth: 20,
          ),
          ListTile(
            leading: Icon(Icons.star_outline),
            title: Text('Top 20 Tracks'),
            minLeadingWidth: 20,
          ),
          ListTile(
            leading: Icon(Icons.grid_view),
            title: Text('My Library'),
            minLeadingWidth: 20,
          ),
          ListTile(
            leading: Icon(Icons.download_outlined),
            title: Text('Downloaded'),
            minLeadingWidth: 20,
          ),

          Spacer(), // Pushes the help and logout to the bottom

          // Bottom items
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help'),
            minLeadingWidth: 20,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQPage()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Log out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
