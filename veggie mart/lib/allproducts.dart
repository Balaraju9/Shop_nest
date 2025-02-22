import 'dart:ui';

import 'package:flutter/material.dart';
import 'productoverview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favcontainesdata.dart';

class allproducts extends StatefulWidget {
  const allproducts();

  @override
  State<allproducts> createState() => _allproductsState();
}

class _allproductsState extends State<allproducts> {
  int index = 0;
  final ratesofproduct={
    "Wireless Headphons":"₹1029",
    "Shoes":"₹2999",
    "Ac":"₹97,000",
    "iphone15":"₹1,19,000",
    "Killing a mocking bird":"₹890",
    "shirts":"₹1999",
    "trousers":"₹999",
    "Pet Foods":"₹200"




  };
  List<String> imgforproducts = [
    "assets/airpodblack.jpg",
    "assets/nowac.jpeg",
    "assets/balu3.jpeg",
    "assets/mocking.jpeg",
    "assets/15ba.jpeg",
    "assets/shw1.jpeg",
    "assets/pan.jpeg",
    "assets/fod1.jpeg",
  ];

  List<Color> colorsfororduct = [
    Color.fromRGBO(144, 214, 212, 3),
    Color.fromRGBO(252, 252, 252, 1),
    Color.fromRGBO(252, 252, 252, 1),
    Color.fromRGBO(216, 191, 197, 1.0),
    Color.fromARGB(255, 192, 193, 188),
    Color.fromARGB(255, 248, 248, 248),
    Color.fromARGB(255, 238, 238, 238),
    Color.fromARGB(255, 173, 190, 173)
  ];

  List<String> productname = [
    'Wireless Headphons',
    'Shoes',
    'Ac',
    'iphone15',
    'Killing a mocking bird',
    'shirts',
    'trousers',
    'Pet Foods'
  ];

  List<int> fav = List<int>.generate(8, (int index) => 0);
  List<String> favoriteItems = [];
  List<String> favoriteItems1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor:  Colors.purple.withOpacity(0.4),
        title: Center(
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.orangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Padding(
              padding: const EdgeInsets.only(right: 38.0),
              child: Text(
                'All Products',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,

                ),
              ),
            ),
          ),
        ),
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black54,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return containerwithproductsrow(context, index, setState, imgforproducts, colorsfororduct, productname, fav, favoriteItems, favoriteItems1,ratesofproduct);
              },
            ),
          ],
        ),
      ),
    );
  }
}

InkWell containerwithproductsrow(
    BuildContext context,
    int index,
    void Function(void Function()) setState,
    List<String> imgforproducts,
    List<Color> colorsfororduct,
    List<String> productname,
    List<int> fav,
    List<String> favoriteItems,
    List<String> favoriteItems1, Map<String, String> ratesofproduct) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductView('E', "S", "ss")));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 17.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(31),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31),
                  color: colorsfororduct[index].withOpacity(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 91,
            right: 6,
            child: Container(
              height: 114,
              width: 190,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.network(imgforproducts[index], fit: index == 4 ? null : BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 155,
            left: 24,
            child: rupeescolors9(ratesofproduct, productname[index]),
          ),
          Positioned(
            top: 129,
            left: 20,
            child: Text(productname[index], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)),
          ),
          Positioned(
            left: 150,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(19),
                  topLeft: Radius.circular(1),
                  bottomRight: Radius.circular(1),
                  bottomLeft: Radius.circular(12),
                ),
                color: Colors.orange,
              ),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    if (fav[index] == 0) {
                      fav[index] = 1;
                      favoriteItems.add(productname[index]);
                      favoriteItems1.add(imgforproducts[index]);
                    } else {
                      fav[index] = 0;
                      favoriteItems.remove(productname[index]);
                      favoriteItems1.remove(imgforproducts[index]);
                    }
                  });

                  // Save the updated favoriteItems and favoriteItems1 to SharedPreferences
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setStringList('favoriteItems', favoriteItems);
                  await prefs.setStringList('favoriteItems1', favoriteItems1);

                  // Optionally, show a Snackbar or some feedback
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fav[index] == 0 ? 'Removed from favorites' : 'Added to favorites')));
                },
                child: Icon(
                  fav[index] == 0 ? Icons.favorite_border_outlined : Icons.favorite,
                  color: fav[index] == 0 ? Colors.white60 : Colors.pinkAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Row rupeescolors9(dynamic ratesofproduct, dynamic productname) {
  return Row(
    children: [
      Text(
        ratesofproduct[productname],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
      ),
      SizedBox(width: 20),
      Row(
        children: [
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39),
              color: Colors.black,
              border: Border.all(width: 2, color: Colors.white70),
            ),
          ),
          SizedBox(width: 4),
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39),
              color: Colors.blueAccent,
              border: Border.all(width: 2, color: Colors.white70),
            ),
          ),
          SizedBox(width: 4),
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39),
              color: Colors.orange,
              border: Border.all(width: 2, color: Colors.white70),
            ),
          ),
        ],
      ),
    ],
  );
}
Row rupeescolors() {
  return Row(
    children: [
      Text(
        "\$120",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
      ),
      SizedBox(width: 20),
      Row(
        children: [
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39),
              color: Colors.black,
              border: Border.all(width: 2, color: Colors.white70),
            ),
          ),
          SizedBox(width: 4),
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39),
              color: Colors.blueAccent,
              border: Border.all(width: 2, color: Colors.white70),
            ),
          ),
          SizedBox(width: 4),
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39),
              color: Colors.orange,
              border: Border.all(width: 2, color: Colors.white70),
            ),
          ),
        ],
      ),
    ],
  );
}
