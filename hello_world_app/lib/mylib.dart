import 'package:flutter/material.dart';

// Main Class Music Page
class ClassMusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Class Music',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const MyLibraryPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'My Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_outlined),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}

// My Library Page
class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({Key? key}) : super(key: key);

  @override
  _MyLibraryPageState createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  bool isDiscoverSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Toggle buttons
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isDiscoverSelected = true),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isDiscoverSelected ? Colors.pink : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      'Discover',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isDiscoverSelected ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isDiscoverSelected = false),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: !isDiscoverSelected ? Colors.pink : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      'My library',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: !isDiscoverSelected ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Content based on selection
        Expanded(
          child: isDiscoverSelected ? 
            Center(child: Text('Discover Content')) : 
            MyLibraryContent(),
        ),
      ],
    );
  }
}

// My Library Content
class MyLibraryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        PlaylistTile(
          icon: Icons.favorite,
          iconColor: Colors.pink,
          title: 'Favourites',
          subtitle: 'Playlist • 10 songs',
          backgroundColor: Colors.pink[50],
        ),
        SizedBox(height: 12),
        PlaylistTile(
          imageUrl: 'assets/playlist1.jpg',
          title: 'Playlist name',
          subtitle: 'Playlist • 14 songs',
        ),
        SizedBox(height: 12),
        PlaylistTile(
          imageUrl: 'assets/playlist2.jpg',
          title: 'Playlist name',
          subtitle: 'Playlist • 14 songs',
        ),
        SizedBox(height: 12),
        PlaylistTile(
          icon: Icons.add,
          iconColor: Colors.grey,
          title: 'New Playlist',
          subtitle: 'Create your Playlist',
          onTap: () => _showCreatePlaylistDialog(context),
        ),
      ],
    );
  }

  void _showCreatePlaylistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreatePlaylistDialog();
      },
    );
  }
}

// Playlist Tile Widget
class PlaylistTile extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String? imageUrl;
  final String title;
  final String subtitle;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const PlaylistTile({
    Key? key,
    this.icon,
    this.iconColor,
    this.imageUrl,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 72,
        child: Row(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                image: imageUrl != null
                    ? DecorationImage(
                        image: AssetImage(imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: icon != null
                  ? Icon(icon, color: iconColor, size: 30)
                  : null,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Create Playlist Dialog
class CreatePlaylistDialog extends StatefulWidget {
  @override
  _CreatePlaylistDialogState createState() => _CreatePlaylistDialogState();
}

class _CreatePlaylistDialogState extends State<CreatePlaylistDialog> {
  bool _showOptions = false;
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _showOptions = !_showOptions;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.add, color: Colors.grey[400], size: 40),
              ),
            ),
            if (_showOptions)
              Column(
                children: [
                  _buildOption(Icons.photo_library, 'Photo Library'),
                  _buildOption(Icons.camera_alt, 'Take Photo or Video'),
                  _buildOption(Icons.more_horiz, 'Browse'),
                ],
              ),
            SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Playlist Title',
                border: UnderlineInputBorder(),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle create action
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      dense: true,
      onTap: () {
        // Handle option selection
      },
    );
  }
}