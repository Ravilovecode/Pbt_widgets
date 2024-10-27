import 'package:flutter/material.dart';
import 'package:hello_world_app/downloadpage.dart';
import 'package:hello_world_app/exercisedetailpage.dart';
import 'package:hello_world_app/homepage.dart';
import 'package:hello_world_app/mylib.dart';
import 'package:hello_world_app/search.dart';

class PBTClassesPage extends StatefulWidget {
  @override
  _PBTClassesPageState createState() => _PBTClassesPageState();
}




class _PBTClassesPageState extends State<PBTClassesPage> {
  int _currentIndex = 0;
  String selectedCategory = 'Sub Junior';

  final List<Widget> _pages = [
    HomeContent(),
    SearchPage(),
    MyLibraryPage(),
    DownloadPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PBT Classes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
      ),

      
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            // Category Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Sub Junior', 'Junior', 'Senior'].map((category) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24), // Increased border radius
                  ),
                  child: ChoiceChip(
                    label: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == category ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: selectedCategory == category,
                    selectedColor: Color(0xFFE91E63),
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // Increased border radius
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Sub Junior Title
            Text(
              selectedCategory,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
            ),
            SizedBox(height: 16),

            // 35 - 40min Classes
            Text(
              '35 - 40min Classes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: ClassCard(image: 'assets/home/juniour.jpeg', title: 'Class 1', exercises: '10 exercises')),
                SizedBox(width: 16),
                Expanded(child: ClassCard(image: 'assets/home/juniour.jpeg', title: 'Class 2', exercises: '10 exercises')),
              ],
            ),
            SizedBox(height: 16),

            // 25 - 30min Band Classes
            Text(
              '25 - 30min Band Classes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: ClassCard(image: 'assets/home/juniour.jpeg', title: 'Class 1', exercises: '10 exercises')),
                SizedBox(width: 16),
                Expanded(child: ClassCard(image: 'assets/home/juniour.jpeg', title: 'Class 2', exercises: '10 exercises')),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFE91E63),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
            
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

class ClassCard extends StatelessWidget {
  final String image;
  final String title;
  final String exercises;

  const ClassCard({
    Key? key,
    required this.image,
    required this.title,
    required this.exercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ExerciseDetailPage()),

      );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(207, 247, 198, 213),
          borderRadius: BorderRadius.circular(15), // Increased border radius
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE91E63).withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)), // Increased border radius
              child: Image.asset(
                image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE91E63),
                    ),
                  ),
                  Text(
                    exercises,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
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
