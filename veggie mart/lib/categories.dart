import 'package:flutter/material.dart';
import 'dart:ui';

import 'productoverview.dart';

import 'allproducts.dart';

class Categories extends StatefulWidget {
  const Categories();

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  var dealsofsmartphone = [
    [
      "vivo y19 P1 Pro 5G  ",
      "₹20,000",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/g/j/t3x-5g-v2338-vivo-original-imahyyzaqhgwzfup.jpeg?q=70&crop=false'
    ],
    [
      "Men Slim Fit Blue",
      "₹1,799",
      "https://rukminim2.flixcart.com/image/832/832/xif0q/trouser/c/j/6/30-m4472dk-navy-beverly-hills-polo-club-original-imahyh93yfyveczb.jpeg?q=70&crop=false",
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
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Center(
          child: Text(
            "All categoriees",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.transparent,
                blurRadius: 5.0,
              ),],
            gradient: LinearGradient(
              colors: [Colors.purple.withOpacity(0.4),Colors.blue.withOpacity(0.2)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,

            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(width: 1.4,
                    color: Colors.white70),
                gradient: LinearGradient(
                  colors: [Colors.purple.withOpacity(0.4), Colors.purple.withOpacity(0.4),Colors.blue.withOpacity(0.2)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Icon(Icons.swipe_down_sharp,
                        size: 30, color: Colors.deepPurple),
                    SizedBox(height: 20),
                    Divider(),
                    _sidebarItem(Icons.local_grocery_store, "Grocery"),
                    _sidebarItem(Icons.checkroom, "Fashion"),
                    _sidebarItem(Icons.kitchen, "Appliance"),
                    _sidebarItem(Icons.phone_android, "Mobiles"),
                    _sidebarItem(Icons.computer, "Compacts"),
                    _sidebarItem(Icons.sports_soccer, "Sports"),
                    _sidebarItem(Icons.book, "Books"),
                    _sidebarItem(Icons.toys, "Toys"),
                    _sidebarItem(Icons.fitness_center, "Fitness"),
                    _sidebarItem(Icons.home, "Home"),

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.withOpacity(0.4), Colors.purple.withOpacity(0.4),Colors.blue.withOpacity(0.2)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,

                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Popular Stores",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _gridItem('Sale is Live', Icons.local_offer),
                      _gridItem('Express Store', Icons.local_shipping),
                      _gridItem('Pocket Bazaar', Icons.store),
                      _gridItem('Happy Rakhi', Icons.cake),
                    ],
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _gridItem('Flash Deals', Icons.flash_on),
                      _gridItem('New Arrivals', Icons.new_releases),
                      _gridItem('Top Rated', Icons.star),
                      _gridItem('Gift Shop', Icons.card_giftcard),
                    ],
                  ),

                  Text(
                    "Recently Viewed Stores",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 28),
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(4, (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductView("ss", "ss", "ss"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0, right: 10),
                            child: Stack(
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
                                Positioned(
                                  bottom: 71,
                                  right: 3,
                                  child: Container(
                                    height: 114,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.network(
                                        dealsofsmartphone[index][2],

                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 155,
                                  left: 24,
                                  child: rupeescolors4(dealsofsmartphone[index][1]),
                                ),
                                Positioned(
                                  top: 129,
                                  left: 20,
                                  child: Text(
                                    dealsofsmartphone[index][0],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16,
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
                                        bottomLeft: Radius.circular(12),
                                      ),
                                      color: Colors.orange,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(2, (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductView("s", "s", "d"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0, right: 10),
                            child: Stack(
                              children: [
                                Container(
                                  height: 190,
                                  width: 190,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.2),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        color: index==1?Colors.white.withOpacity(0.1):Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 71,
                                  right: 3,
                                  child: Container(
                                    height: 114,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.network(
                                        index==1?'https://hips.hearstapps.com/hmg-prod/images/ghi-earbuds-1674851360.png?crop=1.00xw:1.00xh;0,0&resize=1200:*': "https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/i/n/h/xxl-fken101095-freakins-original-imah2wfncag58z6d.jpeg?q=70&crop=false",

                                        fit: index==1?BoxFit.cover:null,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 155,
                                  left: 24,
                                  child: index==1?rupeescolors():Row(
                                    children: [
                                      Text(
                                        "₹999",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                                      ),
                                      SizedBox(width: 4,),
                                      Row(
                                        children: [
                                          Text(
                                            "1" + '29,000',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.black38),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "99% Off",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 129,
                                  left: 20,
                                  child: Text(
                                    index==1?'Wireless Headphones': "Men Animal Print ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16,
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
                                        bottomLeft: Radius.circular(12),
                                      ),
                                      color: Colors.orange,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.indigo),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.indigo)),
          Divider()
        ],
      ),
    );
  }
}

Widget _gridItem(String label, IconData icon) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black38,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}

Row rupeescolors4(String dealsofsmartphone) {
  return Row(
    children: [
      Text(
        dealsofsmartphone,
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
              border: Border.all(width: 1, color: Colors.white70),
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
