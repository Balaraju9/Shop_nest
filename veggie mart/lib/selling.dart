import 'package:flutter/material.dart';
class SellingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Veggie Mart'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Sign in'),
            ),
            ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text('Messages'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Watchlist'),
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Saved'),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended for you',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                color: Colors.grey[300],
                                child: Center(child: Text('Item $index')),
                              ),
                              SizedBox(height: 5),
                              Text('Item $index'),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'More items',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: List.generate(10, (index) {
                      return ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey[300],
                          child: Center(child: Text('Img')),
                        ),
                        title: Text('Item $index'),
                        subtitle: Text('Description $index'),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
