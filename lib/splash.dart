import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding.dart'; // Import your onboarding screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3)); // Splash screen duration
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OnboardingScreen(), // Navigate to onboarding screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'assets/logo/gif.gif', // Your logo image path
              height: 150.h, // Responsive height
            ),
            SizedBox(height: 20.h), // Responsive spacing
            Text(
              'ShopNest', // App title
              style: TextStyle(
                fontSize: 32.sp, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h), // Responsive spacing
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent), // Loading animation color
            ),
          ],
        ),
      ),
    );
  }
}