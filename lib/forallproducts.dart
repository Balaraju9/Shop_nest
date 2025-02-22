import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop1/productoverview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favcontainesdata.dart';
  class allproducts1 extends StatefulWidget {
   late int bal11;
   allproducts1({super.key, required  this.bal11});


  @override
  State<allproducts1> createState() => _allproductsState(bal11);
}
class _allproductsState extends State<allproducts1> {
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
    'https://hips.hearstapps.com/hmg-prod/images/ghi-earbuds-1674851360.png?crop=1.00xw:1.00xh;0,0&resize=1200:*',
    'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?t=st=1721799524~exp=1721803124~hmac=4c4758eb6d446261dc37ec5bcfbf439382e5d184cf98cc3ad09ed797a399c174&w=996',
    'https://img.etimg.com/thumb/msid-91980641,width-300,height-225,imgsize-6188,resizemode-75/.jpg',
    'https://img.freepik.com/free-photo/elegant-smartphone-composition_23-2149437107.jpg?t=st=1721800472~exp=1721804072~hmac=5de482b5280d41290a8ec6be4a34cf87282aa7db6dfee269b08294ff94dc3a69&w=996',
    'https://5.imimg.com/data5/SELLER/Default/2023/5/309141919/ZO/XH/SD/188754325/whatsapp-image-2023-05-18-at-4-45-51-pm-1000x1000.jpg',
    'https://img.freepik.com/free-photo/graphic-shirt-trendy-design-mockup_460848-12971.jpg?t=st=1721799486~exp=1721803086~hmac=1ce8a30db41d9968269d6ceda66d046a8d67c3debd9994ca7337b10dc88f91bc&w=740',
    'https://img.freepik.com/free-photo/man-wearing-beige-shorts-close-up_53876-125260.jpg?t=st=1721801871~exp=1721805471~hmac=c070dab1f0c9bee3179c8159f6659215fde70dee9fef2d6e75e163f59fba2f06&w=740',
    'https://img.freepik.com/free-photo/domestic-pet-food-assortment_23-2148982334.jpg?t=st=1721801795~exp=1721805395~hmac=bd6fe4c477dd2251b6488cc4d0ea1586b4bc05cb07584c4aa07d2d6e490b1013&w=996'
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

  List<int> fav = List<int>.generate(6, (int index) => 0);
  List<String> favoriteItems = [];
  List<String> favoriteItems1 = [];
  dynamic fortommorow = [
    [
      ['assets/s1.png', "17,999", "Air 1 Nike","Shoes"],
      ['assets/s2.png', "15,499", "Adidas Runner",""],
      ['assets/s3.png', "13,999", "Puma Flex"],
      ['assets/s4.png', "18,999", "Reebok Sprint"],
      ['assets/s5.png', "16,499", "Asics Gel"],
      ['assets/s6.png', "14,999", "Under Armour Charge"]
    ],
    [
      ['assets/e1.png', "10,000", "Sony WH-1000XM4","Electronics"],
      ['assets/e2.png', "9,500", "Bose QuietComfort 35"],
      ['assets/e3.png', "8,999", "JBL Live 650BTNC"],
      ['assets/e4.png', "11,000", "Sennheiser HD 450BT"],
      ['assets/e5.png', "9,999", "Beats Studio3"],
      ['assets/e6.png', "10,500", "AKG N700NC M2"]
    ],
    [
      ['assets/c1.png', "29,222", "Hugo Boss Classic","Latest fashion 🔥"],
      ['assets/c2.png', "27,500", "Tommy Hilfiger Modern"],
      ['assets/c3.png', "26,000", "Calvin Klein Slim"],
      ['assets/c4.png', "30,000", "Ralph Lauren Polo"],
      ['assets/c5.png', "28,750", "Lacoste Comfort"],
      ['assets/c6.png', "29,999", "Armani Exchange Casual"]
    ],

  ];
late int ball2;
  _allproductsState(int bal11){

      ball2 = bal11;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor:  Colors.purple.withOpacity(0.4),
        title: Center(
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.lightGreenAccent.withOpacity(0.9),Colors.yellowAccent.withOpacity(0.9), Colors.yellowAccent.withOpacity(0.6)],
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
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black54,)),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return containerwithproductsrow(context, index, setState, fortommorow[ball2][index][0], colorsfororduct, fortommorow[ball2][index][2], fav, favoriteItems, favoriteItems1,fortommorow[ball2][index][1]);
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
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductView(imgforproducts, productname, ratesofproduct)));
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
            child: Text(productname, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)),
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
  );}





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
Row rupeescolors()

{
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