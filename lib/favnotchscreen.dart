import 'dart:ui';

import 'package:flutter/material.dart';

import 'homescreen.dart';
class NoItemsScreen extends StatelessWidget {

  int pu=1;
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xffffe6e6), // Light pink
            Color(0xffffc1e3), // Soft pink
            Color(0xfff9a1b2), // Warm pink
            Color(0xffffc1e3), // Vibrant red
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Image.asset('assets/heart.jpg',fit: BoxFit.cover,),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'No items in favuorites',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Explore more and shortlist some items',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent, // Background color with opacity
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.2,
                  color: Colors.white
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent, // Adjust this color to match your design
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(pu: pu)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Make button background transparent to see the blur effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Add Items',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Text color
                  ),
                ),
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