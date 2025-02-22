import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop1/productoverview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favcontainesdata.dart';

class allproducts2 extends StatefulWidget {
  late int bal11;
  allproducts2({super.key, required this.bal11});

  @override
  State<allproducts2> createState() => _allproductsState(bal11);
}

class _allproductsState extends State<allproducts2> {
  int index = 0;

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



  List<int> fav = List<int>.generate(6, (int index) => 0);
  List<String> favoriteItems = [];
  List<String> favoriteItems1 = [];
  dynamic fortommorow = [
    [
      ['assets/g1.png', "17,999", "Air 1 Nike", "Grocery"],
      ['assets/g2.png', "15,499", "Adidas Runner"],
      ['assets/g3.png', "13,999", "Puma Flex"],
      ['assets/g4.png', "18,999", "Reebok Sprint"],
      ['assets/g5.png', "16,499", "Asics Gel"],
      ['assets/g6.png', "14,999", "Under Armour Charge"]
    ],
    [
      ['assets/c1.png', "29,222", "Hugo Boss Classic", "Latest fashion 🔥"],
      ['assets/c2.png', "27,500", "Tommy Hilfiger Modern"],
      ['assets/c3.png', "26,000", "Calvin Klein Slim"],
      ['assets/c4.png', "30,000", "Ralph Lauren Polo"],
      ['assets/c5.png', "28,750", "Lacoste Comfort"],
      ['assets/c6.png', "29,999", "Armani Exchange Casual"]
    ],
    [
      ['assets/a1.png', "17,999", "Air 1 Nike", "Appliances"],
      ['assets/a2.png', "15,499", "Adidas Runner"],
      ['assets/a3.png', "13,999", "Puma Flex"],
      ['assets/a4.png', "18,999", "Reebok Sprint"],
      ['assets/a5.png', "16,499", "Asics Gel"],
      ['assets/a6.png', "14,999", "Under Armour Charge"]
    ],
    [
      [ 'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/g/j/t3x-5g-v2338-vivo-original-imahyyzaqhgwzfup.jpeg?q=70&crop=false',
          "20,000",

        "vivo y19 P1 Pro 5G  ","Mobiles",
  ],
      [ 'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/z/q/f/-original-imah2fjd75hkcynr.jpeg?q=70&crop=false',
          "₹17,999",

        'Motorola G85 5G ',
              ],
      [ 'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/a/u/4/-original-imah2mc8fvjxgzzg.jpeg?q=70&crop=false',
          "₹15,999",

        'CMF by Nothing ',
              ],
      [ 'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/y/9/0/-original-imahyuhfg2z4fvyh.jpeg?q=70&crop=false',
          "₹15,999",

        'realme P1 5G',
              ],
      [
        'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/n/l/u/-original-imah2fjd7wfd9ksh.jpeg?q=70&crop=false',


        "₹19,999",
        'Motorola G85 5G ',
            ],
      [ 'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/g/j/t3x-5g-v2338-vivo-original-imahyyzaqhgwzfup.jpeg?q=70&crop=false',
          "20,000",

        "vivo y19 P1 Pro 5G  ",
      ],




    ],



    [
      ['assets/e1.png', "10,000", "Sony WH-1000XM4", "Electronics"],
      ['assets/e2.png', "9,500", "Bose QuietComfort 35"],
      ['assets/e3.png', "8,999", "JBL Live 650BTNC"],
      ['assets/e4.png', "11,000", "Sennheiser HD 450BT"],
      ['assets/e5.png', "9,999", "Beats Studio3"],
      ['assets/e6.png', "10,500", "AKG N700NC M2"]
    ],

  ];
  late int ball2;
  _allproductsState(int bal11) {
    ball2 = bal11;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(0.4),
        title: Center(
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                Colors.lightGreenAccent.withOpacity(0.9),
                Colors.yellowAccent.withOpacity(0.9),
                Colors.yellowAccent.withOpacity(0.6)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Padding(
              padding: const EdgeInsets.only(right: 38.0),
              child: Text(
                fortommorow[ball2][0][3],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.yellowAccent.withOpacity(0.7),
                      offset: Offset(0, 0),
                    ),
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.blue.withOpacity(0.5),
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return containerwithproductsrow(
                    context,
                    index,
                    setState,
                    fortommorow[ball2][index][0],
                    colorsfororduct,
                    fortommorow[ball2][index][2],
                    fav,
                    favoriteItems,
                    favoriteItems1,
                    fortommorow[ball2][index][1]);
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
    String imgforproducts,
    List<Color> colorsfororduct,
    String productname,
    List<int> fav,
    List<String> favoriteItems,
    List<String> favoriteItems1,
    String ratesofproduct) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ProductView(imgforproducts, productname, ratesofproduct)));
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
                child: Image.network(imgforproducts),
              ),
            ),
          ),
          Positioned(
            top: 155,
            left: 24,
            child: rupeescolors9(ratesofproduct, productname),
          ),
          Positioned(
            top: 129,
            left: 20,
            child: Text(productname,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16)),
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
                      favoriteItems.add(productname);
                      favoriteItems1.add(imgforproducts);
                    } else {
                      fav[index] = 0;
                      favoriteItems.remove(productname);
                      favoriteItems1.remove(imgforproducts);
                    }
                  });

                  // Save the updated favoriteItems and favoriteItems1 to SharedPreferences
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setStringList('favoriteItems', favoriteItems);
                  await prefs.setStringList('favoriteItems1', favoriteItems1);

                  // Optionally, show a Snackbar or some feedback
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(fav[index] == 0
                          ? 'Removed from favorites'
                          : 'Added to favorites')));
                },
                child: Icon(
                  fav[index] == 0
                      ? Icons.favorite_border_outlined
                      : Icons.favorite,
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
        ratesofproduct,
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

// Row rupeescolors10() {
//   return Row(
//     children: [
//       Text(
//         "\$120",
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
//       ),
//       SizedBox(width: 20),
//       Row(
//         children: [
//           Container(
//             height: 18,
//             width: 18,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(39),
//               color: Colors.black,
//               border: Border.all(width: 2, color: Colors.white70),
//             ),
//           ),
//           SizedBox(width: 4),
//           Container(
//             height: 18,
//             width: 18,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(39),
//               color: Colors.blueAccent,
//               border: Border.all(width: 2, color: Colors.white70),
//             ),
//           ),
//           SizedBox(width: 4),
//           Container(
//             height: 18,
//             width: 18,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(39),
//               color: Colors.orange,
//               border: Border.all(width: 2, color: Colors.white70),
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
