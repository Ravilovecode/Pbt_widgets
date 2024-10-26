import 'package:flutter/material.dart';
import 'package:hello_world_app/homepage.dart';

class Pbtloginpage extends StatelessWidget {
  const Pbtloginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20), // Top margin space
            // Image at the top
            Center(
              child: Image.asset(
                'assets/login.jpeg', // Replace with your image path
                height: 470, // Adjust as necessary
              ),
            ),
            SizedBox(height: 20),

            // Description text
            Text(
              'Log in using the same credentials you use for the PBT website',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Email Input Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Password Input Field
            TextField(
              obscureText: true, // Hide the password text
              decoration: InputDecoration(
                labelText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Login Button
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the HomePage after login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.pink, // Primary button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 10),

            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
