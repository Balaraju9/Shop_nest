import 'package:flutter/material.dart';

import 'favcontainesdata.dart';
import 'favnotchscreen.dart';
class fav extends StatefulWidget {
  const fav();

  @override
  State<fav> createState() => _favState();
}

class _favState extends State<fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 253, 200, 214),
      appBar: AppBar(
        title: Center(child: Text("Favourites", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34,color: Colors.black))),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xffffa7a0), // Light pink
                Color(0xfffc5c7d), // Medium pink
                Color(0xfff77f8d), // Slightly darker pink
                Color(0xffd56062), // Dark red
              ],
            ),
          ),
        ),

      ),
      body: Center(
          child: favcontainesdata(favoriteItems: [], favoriteItems1: [],)),
    );
  }
}











