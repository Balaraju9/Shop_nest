import 'dart:ui';

import 'package:flutter/material.dart';
class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Container(
            height: 190,
            width: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white30,
              border: Border.all(
                  color: Colors.white.withOpacity(0.9),
                  width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
