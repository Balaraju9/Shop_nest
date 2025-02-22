import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'login1.dart';



class LanguageSelectionPage2 extends StatefulWidget {
  @override
  State<LanguageSelectionPage2> createState() => _LanguageSelectionPage1State();
}

class _LanguageSelectionPage1State extends State<LanguageSelectionPage2> {
  void _onLanguageSelected1(String language) {
    print('Selected Language: $language');
  }

  @override
  Widget build(BuildContext context) {
    bool isHovered=false;
    // Get screen size and orientation
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5),
      appBar: AppBar(
        title: Text(
          'మీ పాత్రను ఎంచుకోండి',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.5,

          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(

          ),
        ),

        shadowColor: Colors.black.withOpacity(0.5),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 46.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _onLanguageSelected1('Telugu'),
              child: Container(
                width: isPortrait ? screenWidth * 0.8 : screenWidth * 0.4,
                padding: EdgeInsets.all(screenHeight * 0.02),
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purpleAccent, Colors.deepPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isHovered =!isHovered;
                        });
                      },
                      child: Text(
                        'రైతు',
                        style: TextStyle(
                          color:isHovered?Colors.white:Colors.white,
                          fontSize: screenHeight * 0.03,
                          // Change color on hover
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onLanguageSelected1('English'),
              child: Container(
                width: isPortrait ? screenWidth * 0.8 : screenWidth * 0.4,
                padding: EdgeInsets.all(screenHeight * 0.02),
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'వినియోగదారుడు',
                    style: TextStyle(
                      fontSize: screenHeight * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
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