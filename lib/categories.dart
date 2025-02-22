import 'package:flutter/material.dart';
import 'dart:ui';

import 'productoverview.dart';

class Categories extends StatefulWidget {
  const Categories();

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var dealsofsmartphone = [
    [
      "vivo y19 P1 Pro 5G",
      "₹20,000",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/g/j/t3x-5g-v2338-vivo-original-imahyyzaqhgwzfup.jpeg?q=70&crop=false'
    ],
    [
      "Men Slim Fit Blue",
      "₹1,799",
      "https://rukminim2.flixcart.com/image/832/832/xif0q/trouser/c/j/6/30-m4472dk-navy-beverly-hills-polo-club-original-imahyh93yfyveczb.jpeg?q=70&crop=false",
    ],
    [
      'CMF by Nothing',
      "₹15,999",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/a/u/4/-original-imah2mc8fvjxgzzg.jpeg?q=70&crop=false'
    ],
    [
      'realme P1 5G',
      "₹15,999",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/y/9/0/-original-imahyuhfg2z4fvyh.jpeg?q=70&crop=false'
    ],
    [
      'Motorola G85 5G',
      "₹19,999",
      'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/n/l/u/-original-imah2fjd7wfd9ksh.jpeg?q=70&crop=false'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "All Categories",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.withOpacity(0.6), Colors.blue.withOpacity(0.4)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.withOpacity(0.3), Colors.blue.withOpacity(0.2)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Popular Stores"),
                    SizedBox(height: 20),
                    _buildGrid(4, [
                      _gridItem('Sale is Live', Icons.local_offer),
                      _gridItem('Express Store', Icons.local_shipping),
                      _gridItem('Pocket Bazaar', Icons.store),
                      _gridItem('Happy Rakhi', Icons.cake),
                    ]),
                    SizedBox(height: 15),
                    _buildGrid(4, [
                      _gridItem('Flash Deals', Icons.flash_on),
                      _gridItem('New Arrivals', Icons.new_releases),
                      _gridItem('Top Rated', Icons.star),
                      _gridItem('Gift Shop', Icons.card_giftcard),
                    ]),
                    SizedBox(height: 30),
                    _sectionTitle("Recently Viewed Stores"),
                    SizedBox(height: 20),
                    _buildHorizontalList(dealsofsmartphone),
                    SizedBox(height: 20),
                    _buildHorizontalList([
                      ["Wireless Headphones", "₹999", "https://hips.hearstapps.com/hmg-prod/images/ghi-earbuds-1674851360.png?crop=1.00xw:1.00xh;0,0&resize=1200:*"],
                      ["Men Animal Print", "₹999", "https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/i/n/h/xxl-fken101095-freakins-original-imah2wfncag58z6d.jpeg?q=70&crop=false"]
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(19), bottomRight: Radius.circular(19)),
          border: Border.all(width: 1, color: Colors.white70),
          gradient: LinearGradient(
            colors: [Colors.purple.withOpacity(0.3), Colors.blue.withOpacity(0.2)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Icon(Icons.swipe_down_sharp, size: 24, color: Colors.deepPurple),
              SizedBox(height: 15),
              Divider(color: Colors.white54),
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
    );
  }

  Widget _sidebarItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.indigo),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize:9,color: Colors.indigo)),
          Divider()
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.black87,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildGrid(int crossAxisCount, List<Widget> children) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: NeverScrollableScrollPhysics(),
      children: children,
    );
  }

  Widget _gridItem(String label, IconData icon) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 1022),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.black38,
                child: Icon(icon, size: 30, color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Flexible(
              child: Text(
                label,
                style: TextStyle(fontSize: 9),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalList(List<List<String>> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: _itemCard(item[0], item[1], item[2]),
          );
        }).toList(),
      ),
    );
  }

  Widget _itemCard(String title, String price, String imageUrl) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.15),
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 2))],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.white.withOpacity(0.1)),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(39),
            child: Image.network(
              imageUrl,
              height: 125,
              width: 49,

            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          right: 20,
          child: Column(
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: 23,
                  ),
                  Text(price, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "${3.toStringAsFixed(1)}% OFF",
                    style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
