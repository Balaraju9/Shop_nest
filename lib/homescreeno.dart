import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'profile.dart';
import 'settings.dart';
import 'selling.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'user_state.dart';
import 'profile.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _currentPage = 0;

  List<Map<String, dynamic>> chatmodels = [
    {
      "name": "Dev Stack",
      "isGroup": false,
      "currentMessage": "Hi Everyone",
      "time": "4:00",
      "icon": "person.svg",
      "id": 1,
    },
    {
      "name": "Kishor",
      "isGroup": false,
      "currentMessage": "Hi Kishor",
      "time": "13:00",
      "icon": "person.svg",
      "id": 2,
    },
    {
      "name": "Collins",
      "isGroup": false,
      "currentMessage": "Hi Dev Stack",
      "time": "8:00",
      "icon": "person.svg",
      "id": 3,
    },
    {
      "name": "Balram Rathore",
      "isGroup": false,
      "currentMessage": "Hi Dev Stack",
      "time": "2:00",
      "icon": "person.svg",
      "id": 4,
    },
  ];
  final List<String> _images = [
    'assets/logo/s1.png',
    'assets/logo/s2.png',
    'assets/logo/s3.png',
    'assets/logo/s4.png',
    'assets/logo/s5.png',
    'assets/logo/snbird3.png',
  ];

  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      _buildHomeScreen(),
      SellingScreen(),
      _buildSearchScreen(),
      _buildInboxScreen(),
      const SellerProfile(), // Your profile screen
    ];
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 299),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavigationBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildDrawer() {
    final userState = UserState();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              userState.username ?? 'Balaraju...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              userState.email ?? 'Balaraju2020@gmail.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/hand-drawn-heart-cartoon-character-illustration_23-2150497827.jpg?t=st=1721703363~exp=1721706963~hmac=d276478e751e1979401811a0e91e2998405cf33ffefeb9ce1dea6dab1d3b21d9&w=740', // Replace with your image URL
                ),
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
            leading: Icon(Icons.person),
            title: Text('Account'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellerProfile()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Orders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Support'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }



  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[199],
        borderRadius: BorderRadius.circular(9),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 9),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search on ShopNest',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryButton('Selling'),
        _buildCategoryButton('Deals'),
        _buildCategoryButton('Categories'),
        _buildCategoryButton('Saved'),
      ],
    );
  }

  Widget _buildCategoryButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
          side: const BorderSide(color: Colors.grey),
        ),
        elevation: 0,
      ),
      child: Text(text),
    );
  }


  Widget _buildSellingBanner() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.yellow[699],
      child: const Text(
        'Have you been selling on Shop Nest already?',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 199,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Image.network(
              _images[index],
              fit: BoxFit.contain,
              width: 299,
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommended for you',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 9),
        _buildCourseList(),
      ],
    );
  }

  Widget _buildCourseList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(9, (index) => _buildCourseItem()),
      ),
    );
  }

  Widget _buildCourseItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      width: 199,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'assets/logo/snbird7.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 199,
          ),
          const SizedBox(height: 9),
          const Text(
            'Welcome seller',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text('Explore more'),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 9),
          _buildSearchBar(),
          const SizedBox(height: 9),
          _buildCategoryButtons(),
          const SizedBox(height: 9),
          _buildSellingBanner(),
          const SizedBox(height: 9),
          _buildImageCarousel(),
          const SizedBox(height: 9),
          _buildCourseSection(),
        ],
      ),
    );
  }

  Widget _buildSellingScreen() {
    return Center(
      child: Text('Selling'),
    );
  }
  Widget _buildSearchScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search here...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget _buildInboxScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatmodels.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    var sourceChat = chatmodels.removeAt(index);
                  });

                },
                child: Padding(
                  padding:  EdgeInsets.all(29),
                  child: Row(
                    children: [
                    // Display an avatar/icon on the left
                    CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person), // Replace with image if available
                  ),
                  SizedBox(width: 16), // Space between avatar and text
                  // Display name, message, and time details in a column
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chatmodels[index]["name"],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            chatmodels[index]["currentMessage"],
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      ),
                ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        chatmodels[index]["time"]+" PM",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                        overflow: TextOverflow.ellipsis,
                      ),


                  ]

              ),
            ),
          ),
      )

    )
      ],
      )
    );

  }

  Widget _buildBottomNavigationBar() {
    return CurvedNavigationBar(
      index: _currentIndex,
      onTap: _onBottomNavigationBarTap,
      color: Colors.blue,
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.blue,
      height: 60.0,
      items: const [
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.sell, size: 30, color: Colors.white),
        Icon(Icons.search, size: 30, color: Colors.white),
        Icon(Icons.message, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopNest'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      drawer: _buildDrawer(),
      body: _children[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Drugs",
    "Electronic Devices",
    "Iron scrap",
    "Hard disks",
    "Cars",
    "Apartments",
    "Land",
    "Vechicles",
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

