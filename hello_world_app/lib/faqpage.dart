import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Help',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // FAQ Section
          Row(
            children: [
              Icon(Icons.help_outline, color: Colors.pink[400]),
              SizedBox(width: 8),
              Text(
                'FAQs',
                style: TextStyle(
                  color: Colors.pink[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // FAQ Categories
          FAQCategory(title: 'App Usage', questions: [
            'Can I watch the videos on a bigger screen?',
            'How do I search for specific tracks or composers?',
            'How do I remove a track from my playlist?',
            'Can I reorder tracks in my playlist?',
            'How do I share playlists with other PBT teachers?',
          ]),
          FAQCategory(title: 'Technical Issues', questions: []),
          FAQCategory(title: 'Account and Subscription', questions: []),
          SizedBox(height: 24),
          // Support Section
          Row(
            children: [
              Icon(Icons.mail_outline, color: Colors.pink[400]),
              SizedBox(width: 8),
              Text(
                'Support',
                style: TextStyle(
                  color: Colors.pink[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Need help? For any questions and assistance, please reach out to us at ',
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              // Add email launch functionality if needed
            },
            child: Text(
              'customerservice@pbt.dance',
              style: TextStyle(color: Colors.pink[400], fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQCategory extends StatelessWidget {
  final String title;
  final List<String> questions;

  FAQCategory({required this.title, required this.questions});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.pink[400],
          fontWeight: FontWeight.w600,
        ),
      ),
      initiallyExpanded: title == 'App Usage', // Expand the first section by default
      children: questions.map((question) {
        return ListTile(
          title: Text(question),
        );
      }).toList(),
    );
  }
}
