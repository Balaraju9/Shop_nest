import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop1/signup.dart';
import 'productoverview.dart';
import 'suchendrsetting.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stack_trace/stack_trace.dart';

import 'ProfileScreen.dart';
import 'allproducts.dart';

class HomeScreen extends StatefulWidget {
  final int pu;

  const HomeScreen( {this.pu = 0});
  @override
  State<HomeScreen> createState() => _HomeScreenState(pu);
}
class _HomeScreenState extends State<HomeScreen> {
  int curr = 0, ba = 0;
  List<String> nocolorforthis=["Ac","Killing a mocking bird","Pet Foods","iphone15"];
  final ratesofproduct={
    "Wireless Headphons":"₹1029",
    "Shoes":"₹2999",
    "Ac":"₹97,000",
    "Killing a mocking bird":"₹890",
    "iphone15":"₹1,19,000",

    "shirts":"₹1999",
    "trousers":"₹999",
    "Pet Foods":"₹200"




  };
  int _currentIndex = 0;
  var myInt = 0;
  int cutprice1 = 0;
  var k = Color.fromARGB(255, 30, 31, 34);
  List<int> fav = List.generate(8, (index) => 0);
  var dealsofsmartphone = [
    [
      "vivo y19 P1 Pro 5G  ",
      "20,000",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/g/j/t3x-5g-v2338-vivo-original-imahyyzaqhgwzfup.jpeg?q=70&crop=false'
    ],
    [
      'Motorola G85 5G ',
      "₹17,999",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/z/q/f/-original-imah2fjd75hkcynr.jpeg?q=70&crop=false'
    ],
    [
      'CMF by Nothing ',
      "₹15,999",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/a/u/4/-original-imah2mc8fvjxgzzg.jpeg?q=70&crop=false'
    ],
    [
      'realme P1 5G',
      "₹15,999",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/y/9/0/-original-imahyuhfg2z4fvyh.jpeg?q=70&crop=false'
    ],
    [
      'Motorola G85 5G ',
      "₹19,999",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/n/l/u/-original-imah2fjd7wfd9ksh.jpeg?q=70&crop=false'
    ],
  ];
  List<dynamic> dealsonfashion = [
    [
      "Men Slim Fit Blue",
      "₹1,799",
      "https://rukminim2.flixcart.com/image/832/832/xif0q/trouser/c/j/6/30-m4472dk-navy-beverly-hills-polo-club-original-imahyh93yfyveczb.jpeg?q=70&crop=false",
      Color.fromARGB(255, 194, 193, 191)
    ],
    [
      "Pink Women Sling Bag",
      "₹639",
      "https://rukminim2.flixcart.com/image/832/832/xif0q/sling-bag/p/v/3/-original-imagmmg2dzyzct6h.jpeg?q=70&crop=false",
      Colors.white
    ],
    [
      "Men Boxy Fit  ",
      "₹3249",
      "https://rukminim2.flixcart.com/image/416/416/xif0q/shirt/1/l/b/m-4mss2676-03-snitch-original-imagyhb956ghw2hh.jpeg?q=70&crop=false",
      Color.fromARGB(255, 245, 245, 245)
    ],
    [
      "Men Relaxed Fit",
      "₹349",
      "https://rukminim2.flixcart.com/image/416/416/xif0q/shirt/v/3/i/l-wrp-marmic-fab-original-imahy8mcuckpgdhh.jpeg?q=70&crop=false",
      Color.fromARGB(255, 186, 186, 186)
    ],
    [
      "Men Animal Print Round Neck",
      "₹999",
      "https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/i/n/h/xxl-fken101095-freakins-original-imah2wfncag58z6d.jpeg?q=70&crop=false",
      Color.fromARGB(255, 174, 131, 115)
    ],
  ];
  var colorsfororduct = [
    Color.fromRGBO(144, 214, 212, 3),
    Color.fromRGBO(252, 252, 252, 1),
    Color.fromRGBO(252, 252, 252, 1),

    Color.fromARGB(255, 192, 193, 188),
    Color.fromRGBO(216, 191, 197, 1.0),

    Color.fromARGB(255, 248, 248, 248),
    Color.fromARGB(255, 238, 238, 238),
    Color.fromARGB(255, 173, 190, 173)
  ];
  List<String> productname = [
    "Wireless Headphons",

    "Ac",
    "Shoes",
    "Killing a mocking bird",
    "iphone15",

    "shirts",
    "trousers",
    "Pet Foods"
  ];
  List imgforproducts = [
    "assets/airpodblack.jpg",
    "assets/nowac.jpeg",
    "assets/balu3.jpeg",
    "assets/mocking.jpeg",
    "assets/15ba.jpeg",
    "assets/shw1.jpeg",
    "assets/pan.jpeg",
    "assets/fod1.jpeg",


  ];
  List<dynamic> img = [
    'assets/shoescat.jpg',
    'assets/electro.jpg',
    'assets/clothing.jpg',
    'assets/furniture.jpg',
    'assets/toys.jpg',
    'assets/beauty.jpg',
    'assets/sports.jpg',
    'assets/automotive.png',

  ];

  List<dynamic> underText = [
    Text('Shoes',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Electronics',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Clothing',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Furniture',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Toys',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Beauty',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Sports',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Automotive',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
  ];

  _HomeScreenState(int pu) {
    ba = pu;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:  Colors.purple.withOpacity(0.4),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Balaraju...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              accountEmail: Text(
                'Balaraju2020@gmail.com',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black38),
              ),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-vector/hand-drawn-heart-cartoon-character-illustration_23-2150497827.jpg?t=st=1721703363~exp=1721706963~hmac=d276478e751e1979401811a0e91e2998405cf33ffefeb9ce1dea6dab1d3b21d9&w=740'), // Replace with your image URL
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF7A97CC), // Light Blue
                    Color(0xFF536AE8), // Sky Blue
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Orders'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SettingsScreen()));

              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SimpleRegisterScreen()));
// Handle logout
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'assets/logo/snbird.png', // Make sure the path to the image is correct
                height: 40, // Adjust the height as needed
              ),
              SizedBox(width: 10), // Adjust the spacing as needed
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.6)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  'Shop Nest',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 11.0,
                        color: Colors.blue.withOpacity(0.5),
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        leading: ba == 0
            ? null
            : InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 36,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.1), // Subtle background color
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22, // Slightly smaller icon for balance
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.8), // Light background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              padding: EdgeInsets.all(5), // Slightly increased padding
            ),
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_sharp,
              color: Colors.black,
              size: 26, // Adjusted icon size
            ),
          ),
        ],
        elevation: 0, // Optional: remove the default AppBar shadow
        backgroundColor: Colors.transparent, // Transparent background to show underlying content
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.withOpacity(0.4),Colors.blue.withOpacity(0.2)], // Gradient background
              begin: Alignment.bottomCenter,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [
            searchbar(),
            SizedBox(height: 26),
            imageslider(),
            SizedBox(
              height: 27,
            ),
            categories(),
            SizedBox(
              height: 10,
            ),
            specialforu(),
            SizedBox(
              height: 18,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return containerwithproductsrow(context, index,ratesofproduct,productname);
                }),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(right:168),
              child: Text(
                "Deals On Smartphones ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    containerwithproductsrow1(
                        context,
                        i,
                        dealsofsmartphone[i][0],
                        dealsofsmartphone[i][1],
                        dealsofsmartphone[i][2],
                        1)
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(right:148),
              child: Text(
                "Deals On Fashion For you 🔥",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    containerwithproductsrow1(context, i, dealsonfashion[i][0],
                        dealsonfashion[i][1], dealsonfashion[i][2], 2)
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }

  InkWell containerwithproductsrow(BuildContext context, int index, dynamic ratesofproduct, dynamic productname) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductView(imgforproducts[index], productname[index], ratesofproduct[productname[index]])));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
        child: Stack(
          children: [
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(31),
                color: colorsfororduct[index],
              ),
            ),
            Positioned(
              top: 5,

              right: 10,
              child: Container(
                height: 110,
                width: 190,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.network(
                      imgforproducts[index],
                      fit: index == 4 ? null : BoxFit.cover,
                    )),
              ),
            ),
            Positioned(
              top: 158,
              left: 20,
              child: rupeescolors(ratesofproduct[productname[index]], nocolorforthis, productname, index),
            ),
            Positioned(
              top: 135,
              left: 20,
              child: Text(
                productname[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16),
              ),
            ),
            Positioned(
              left: 150,
              top: 8,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(19),
                        topLeft: Radius.circular(1),
                        bottomRight: Radius.circular(1),
                        bottomLeft: Radius.circular(12)),
                    color: Colors.orange),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        if (fav[index] == 0) {
                          fav[index] = 1;
                        } else {
                          fav[index] = 0;
                        }
                      });
                    },
                    child: Icon(
                      fav[index] == 0
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      color: fav[index] == 0 ? Colors.white60 : Colors.pinkAccent,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell containerwithproductsrow1(BuildContext context, int index,
      String name, String price, String imgurl, int cutprice) {
    cutprice1 = cutprice;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductView(imgforproducts[index], productname[index],"3939")));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0),
        child: Stack(
          children: [
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(31),
                color: cutprice == 2 ? dealsonfashion[index][3] : Colors.white,
              ),
            ),
            Positioned(
              bottom: 65,
              right: 1,
              child: Container(
                height: 108,
                width: 180,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      imgurl,
                    )),
              ),
            ),
            Positioned(
              top: 155,
              left: 20,
              child: rupeescolors1(price, cutprice1),
            ),
            Positioned(
              top: 129,
              left: 20,
              child: cutprice == 0
                  ? Text(
                name,
                style: (TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16)),
              )
                  : Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  name,
                  style: (TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16)),
                ),
              ),
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
                        bottomLeft: Radius.circular(12)),
                    color: Colors.orange),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        if (fav[index] == 0) {
                          fav[index] = 1;
                        } else {
                          fav[index] = 0;
                        }
                      });
                    },
                    child: Icon(
                      fav[index] == 0
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      color:
                      fav[index] == 0 ? Colors.white60 : Colors.pinkAccent,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row rupeescolors1(String price, int cutprice1) {
    return Row(
      children: [
        cutprice1 == 0
            ? Text(
          price,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        )
            : Text(
          price,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        SizedBox(
          width: cutprice1 == 0 ? 20 : 7,
        ),
        Row(
          children: [
            cutprice1 == 0
                ? Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.black,
                  border: Border.all(width: 2, color: Colors.white70)),
            )
                : Row(
              children: [
                Text(
                  "1" + '29,000',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "18% Off",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 6),
                ),
              ],
            ),
            SizedBox(
              width: 4,
            ),
            cutprice1 == 0
                ? Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.blueAccent,
                  border: Border.all(width: 2, color: Colors.white70)),
            )
                : //
            SizedBox(
              width: 4,
            ),
            cutprice1 == 0
                ? Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.orange,
                  border: Border.all(width: 2, color: Colors.white70)),
            )
                : //
            SizedBox(
              width: 4,
            ),
            cutprice1 == 0
                ? Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.black12)),
              child: Text(
                '+2',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            )
                : //
            SizedBox(
              width: 0,
            ),
          ],
        ),
      ],
    );
  }

  Row rupeescolors(dynamic rupeesfrommap,List<String> nocolorforthis,dynamic productname, int index) {
    return Row(
      children: [
        Text(
          rupeesfrommap,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        SizedBox(
            width: nocolorforthis.contains(productname[index])==false?20:8
        ),
        Row(

          children: [

            nocolorforthis.contains(productname[index])==true? Padding(
              padding:  EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  Text(
                    rupeesfrommap+"9",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11.5,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "98% Off",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 6),
                  ),
                ],
              ),
            )://
            nocolorforthis.contains(productname[index])==false? Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.black,
                  border: Border.all(width: 2, color: Colors.white70)),
            )://
            SizedBox(
              width: 4,
            ),
            nocolorforthis.contains(productname[index])==false?Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.blueAccent,
                  border: Border.all(width: 2, color: Colors.white70)),
            )://
            SizedBox(
              width: 4,
            ),
            nocolorforthis.contains(productname[index])==false?Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.orange,
                  border: Border.all(width: 2, color: Colors.white70)),
            )://
            SizedBox(
              width: 4,
            ),
            nocolorforthis.contains(productname[index])==false?Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.black12)),
              child: Text(
                '+2',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            )://
            SizedBox(width: 0,),
          ],
        ),
      ],
    );
  }

  Row specialforu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 0,
        ),
        Text(
          'Special For You',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        ),
        SizedBox(
          width: 190,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => allproducts()));
            },
            child: Text(
              'See all',
              style: TextStyle(color: Colors.black),
            )),
        SizedBox(
          height: 0,
        )
      ],
    );
  }

  Container categories() {
    return Container(
      height: 120,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // No blur applied
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white.withOpacity(0.3), // Semi-transparent background
            border: Border.all(color: Colors.transparent, width: 1.0), // Light border
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: img.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(

                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.purpleAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.network(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        underText[index],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  Container imageslider() {
    final List<String> imgList = [
      'assets/imageslid1.jpg',
      'assets/imageslid2.jpg',
      'assets/imageslid4.jpg',
      'assets/imageslid3.jpg',
      'assets/imageslid5.jpg',
    ];

    return Container(
      height: 280, // Adjusted height to accommodate dots indicator
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Stack(
          children: [
            // BackdropFilter for frosted glass effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.transparent), // Border with opacity
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: imgList.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              imgList[index],
                              fit: BoxFit.cover, // Cover to maintain aspect ratio
                              width: double.infinity, // Full width
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SmoothPageIndicator(
                    controller: PageController(
                      initialPage: _currentIndex,
                    ),
                    count: imgList.length,
                    effect: SlideEffect(
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      spacing: 4.0,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Padding searchbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 30),
      child: Container(
        height: 51,
        width: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white.withOpacity(0.5), // Semi-transparent white background
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Colors.white70
                  ),
                  borderRadius: BorderRadius.circular(19),
                  color: Colors.white.withOpacity(0.2), // Light frosted effect
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
                Icon(Icons.search_sharp, color: Colors.black, size: 30), // Adjusted size
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)), // Subtle hint color
                    ),
                  ),
                ),
                Container(
                  height: 27,
                  width: 1, // Adjusted width for better proportion
                  color: Colors.black.withOpacity(0.5), // Darker divider
                ),
                SizedBox(width: 20),
                Icon(Icons.tune, color: Colors.black),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
