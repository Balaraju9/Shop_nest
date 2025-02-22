import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'productoverview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favnotchscreen.dart';

class favcontainesdata extends StatefulWidget {
  const favcontainesdata({ required List favoriteItems, required List favoriteItems1});

  @override
  State<favcontainesdata> createState() => _favcontainesdataState();
}

class _favcontainesdataState extends State<favcontainesdata> {
  List<String> items = [];
  List<String> items1 = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  List<String> imgfronpre = [];

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      items = prefs.getStringList('favoriteItems') ?? [];
      items1 = prefs.getStringList('favoriteItems1') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 153, 153, 153),
      body: items.length >= 1
          ? SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 23),
            GridView.builder(

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,

                mainAxisSpacing: 31.0,
              ),


              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductView("d","s","dj")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 240,
                          width: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(144, 214, 212, 3),
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
                              child: Image.network(
                                items1[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 155,
                          left: 24,
                          child: rupeescolors(),
                        ),
                        Positioned(
                          top: 129,
                          left: 20,
                          child: Text(
                            items[index],
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
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 180,
                          left: 32,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                                items1.removeAt(index);
                                // Save the updated list to SharedPreferences
                                SharedPreferences.getInstance().then((prefs) {
                                  prefs.setStringList('favoriteItems', items);
                                  prefs.setStringList('favoriteItems1', items1);
                                });
                              });
                            },
                            icon: Icon(
                              Icons.delete_outline_sharp,
                              color: Colors.red,
                            ),
                            label: Text('Remove'),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black38, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )
          : Center(child: NoItemsScreen()),
    );
  }
}

Row rupeescolors() {
  return Row(
    children: [
      Text(
        '\$120',
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
          SizedBox(width: 4),
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39),
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.black12),
            ),
            child: Text(
              '+2',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

