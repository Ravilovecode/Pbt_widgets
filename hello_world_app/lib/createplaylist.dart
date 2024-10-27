import 'package:flutter/material.dart';

// Create Playlist Dialog
class CreatePlaylistDialog extends StatefulWidget {
  @override
  _CreatePlaylistDialogState createState() => _CreatePlaylistDialogState();
}

class _CreatePlaylistDialogState extends State<CreatePlaylistDialog> {
  final TextEditingController _titleController = TextEditingController();
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 250,
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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.add, color: Colors.grey),
              ),
            ),
            if (_showOptions)
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    dense: true,
                    onTap: () {
                      // Handle photo library selection
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Take Photo or Video'),
                    dense: true,
                    onTap: () {
                      // Handle camera
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.more_horiz),
                    title: Text('Browse'),
                    dense: true,
                    onTap: () {
                      // Handle browse
                    },
                  ),
                ],
              ),
            SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Playlist Title',
                border: UnderlineInputBorder(),
              ),
            ),
            Spacer(),
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
                ElevatedButton(
                  onPressed: () {
                    // Handle playlist creation
                    if (_titleController.text.isNotEmpty) {
                      Navigator.pop(context, _titleController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
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
}
