import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductView extends StatefulWidget {
  final dynamic imgForProduct;
  final String productName;
  final dynamic ratesofproduct;



  ProductView( this.imgForProduct, this.productName, this.ratesofproduct);@override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final PageController _controller = PageController(viewportFraction: 0.8, keepPage: true);
  int addToCart = 0;
  int countOfProducts = 1;
  List<String> sendingtocart =[];
  List<String> sendingtocart1 =[];
  List<String> sendingtocart2 =[];
  int descr = 0, specif = 0, review = 0;
  int favu = 1;
  dynamic baImg;
  dynamic price;
  String prName = " ";
  int black = 0, blue = 0, orange = 0, red = 0, white = 0, otherColors = 0;
  List<String> imagesofproductinprvi=[

    'assets/red.jpg',
    'assets/airpodblack.jpg',
    'assets/airpodblue.jpg',
    'assets/orange.jpg',
    'assets/airpodwhite.jpg',



  ];
  int indeximagesofproductinprvi=0;

  @override
  void initState() {
    super.initState();
    prName = widget.productName;
    baImg = widget.imgForProduct;
    price=widget.ratesofproduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 70,
        width: 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.black,
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 70,
                    top: 0,

                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (countOfProducts > 0) {
                            countOfProducts--;
                          }
                        });
                      },
                      icon: Icon(Icons.remove, color: Colors.white, size: 31),
                    ),
                  ),
                  Positioned(
                    left: countOfProducts > 9 ? 43 : 51,
                    child: Text(
                      '$countOfProducts',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    top: 1,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          countOfProducts++;
                        });
                      },
                      icon: Icon(Icons.add, color: Colors.white, size: 25),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                setState(() {
                  addToCart = addToCart == 0 ? 1 : 0;
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  color: addToCart == 0 ? Colors.orange : Colors.grey,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: addToCart == 0 ? 19.0 : 8, top: 10),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        sendingtocart.add(prName);
                        sendingtocart1.add(price);
                        sendingtocart2.add(baImg);
                      });
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setStringList('sendingtocart', sendingtocart);
                      await prefs.setStringList('sendingtocart1', sendingtocart1);
                      await prefs.setStringList('sendingtocart2', sendingtocart2);
                    },

                    child: Text(
                      addToCart == 0 ? "Add To Cart" : "Added To Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: addToCart == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.black54),
              gradient: LinearGradient(
                colors: [Colors.purple.withOpacity(0.4), Colors.blue.withOpacity(0.2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(40),
              color: Colors.black12,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 26),
            ),
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [Colors.purple.withOpacity(0.4), Colors.blue.withOpacity(0.2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Icon(Icons.share_sharp, color: Colors.white, size: 26),
            ),
          ),
          SizedBox(width: 31),
          InkWell(
            onTap: () {
              setState(() {
                favu = favu == 1 ? 0 : 1;
              });
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  colors: [Colors.purple.withOpacity(0.4), Colors.blue.withOpacity(0.2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(
                  favu == 1 ? Icons.favorite_border_outlined : Icons.favorite,
                  color: Colors.pinkAccent,
                  size: 27,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(

              height: 211,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      allowImplicitScrolling: true,
                      physics: ClampingScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 7),
                          child: prName=="Wireless Headphons"?Image.network(imagesofproductinprvi[indeximagesofproductinprvi]):Image.network(baImg, fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 391,
                    child: IconButton(onPressed: (){
                        setState(() {

                        });

                    }, icon: Icon(Icons.arrow_forward_ios_sharp)),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30),
            detailscontainer(),
          ],
        ),
      ),
    );
  }


  Container detailscontainer() {
    return Container(

      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.withOpacity(0.4),Colors.blue.withOpacity(0.2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      padding: EdgeInsets.only(

        top: 20,
        bottom: 300,
      ),
      child: Column(
        children: [
          Padding(
            padding: prName.length>=10? EdgeInsets.only(right: 230.0):EdgeInsets.only(right: 348.0),
            child: Text(prName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          Padding(
            padding: price.length>3? EdgeInsets.only(right: 360.0):EdgeInsets.only(right: 370.0),
            child: Text(price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Seller : ",style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('Balaraju🙂',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Container(
                  height: 22,
                  width: 56,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(39)
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(Icons.star_sharp,color: Colors.white,size: 18,),
                      SizedBox(
                        width: 6,
                      ),
                      Text('4.8',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("(320 Reviews)",style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 339.0),
            child: Text('Colors',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          ),
          Row(//colors
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    indeximagesofproductinprvi=1;
                    black=1;
                    white=0;
                    blue=0;
                    orange=0;
                    red=0;

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(39),
                        color: Colors.black,
                        border: Border.all(
                            width: 2,
                            color: Colors.white70
                        ),
                        boxShadow:
                        [
                          BoxShadow(
                            color: Colors.black,

                            blurRadius: black==1?26.0:0,
                            spreadRadius: black==1?2.0:0.0,
                          )
                        ]
                    ),


                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    black = 0;
                    white = 0;
                    indeximagesofproductinprvi=2;
                    blue = 1;
                    orange = 0;
                    red = 0;
                  });
                },
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(39),
                      color: Colors.blueAccent,
                      border: Border.all(
                          width: 2,
                          color: Colors.white70
                      ),
                      boxShadow:
                      [
                        BoxShadow(
                          color: Colors.blueAccent,

                          blurRadius: blue==1?23.0:0,
                          spreadRadius: blue==1?9:0,
                        )
                      ]

                  ),

                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    black = 0;
                    white = 0;
                    blue = 0;
                    indeximagesofproductinprvi=3;
                    orange = 1;
                    red = 0;
                  });
                },
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(39),

                      color: Colors.orange,
                      border: Border.all(
                          width: 2,
                          color: Colors.white70
                      ),



                      boxShadow:
                      [
                        BoxShadow(
                          color: Colors.orange,

                          blurRadius: orange==1?26.0:0,
                          spreadRadius: orange==1?1.0:0,
                        )
                      ]

                  ),

                ),
              ),
              SizedBox(
                width: 16,
              ),

              InkWell(
                onTap: (){
                  setState(() {
                    indeximagesofproductinprvi=4;

                    otherColors=1;
                  });
                },
                child: otherColors==0?othercolrs():othercolrs1(),),



            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              InkWell(
                onTap: (){
                  setState(() {
                    review=0;
                    descr=1;
                    specif=0;
                  });
                },
                child: Container(

                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                      ,
                      color: descr==1?Colors.orange:Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: descr==1?Offset(0, 0):Offset(0, 0),
                            blurRadius: descr==1?2:0,

                            color: Colors.black
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13.0,top: 6),
                    child: Text("Description",style: TextStyle(color: descr==1?Colors.white:Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 19),),
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  setState(() {
                    review=0;
                    descr=0;
                    specif=1;
                  });
                },
                child: Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                      ,
                      color: specif==1?Colors.orange:Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: specif==1?Offset(0, 0):Offset(0, 0),
                            blurRadius: specif==1?7:0,

                            color: Colors.black
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 6),
                    child: Text("Specification",style: TextStyle(color: specif==1?Colors.white:Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 19),),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    review=1;
                    descr=0;
                    specif=0;
                  });
                },
                child: Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                      ,
                      color: review==1?Colors.orange:Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: review==1?Offset(0, 0):Offset(0, 0),
                            blurRadius: review==1?7:0,

                            color: Colors.black
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 34.0,top: 4),
                    child: Text("Reviews",style: TextStyle(color: review==1?Colors.white:Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 21),),
                  ),
                ),
              ),
            ],

          ),
          SizedBox(
            height: 30,
          ),


    descr == 1
    ? description1()
        : specif==1
    ? specification()
        : review==1
    ? getEarbudsReviews()
        : description1(),





        ],
      ),

    );
  }
  Container getEarbudsReviews() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          ..._buildReviewItems(),
        ],
      ),
    );
  }

  List<Widget> _buildReviewItems() {
    return [
      reviewItem(
        name: 'John Doe',
        rating: 5,
        comment: '🎧 Amazing sound quality and battery life! Highly recommend these earbuds.',
      ),
      reviewItem(
        name: 'Jane Smith',
        rating: 4,
        comment: '👍 Comfortable fit and excellent noise cancellation. Worth the price.',
      ),
      reviewItem(
        name: 'Sam Wilson',
        rating: 3,
        comment: '⚡ Good earbuds, but the connectivity can be inconsistent at times.',
      ),
      reviewItem(
        name: 'Emily Davis',
        rating: 5,
        comment: '🎵 Best earbuds I have ever used! The sound clarity is fantastic.',
      ),
      reviewItem(
        name: 'Michael Brown',
        rating: 4,
        comment: '💰 Great value for money. The touch controls are very responsive.',
      ),
    ];
  }

  Widget reviewItem({required String name, required int rating, required String comment}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 8),
              ...List.generate(rating, (index) => Icon(Icons.star, color: Colors.orange, size: 18)),
              ...List.generate(5 - rating, (index) => Icon(Icons.star_border, color: Colors.orange, size: 18)),
            ],
          ),
          SizedBox(height: 5),
          Text(
            comment,
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
          SizedBox(height: 10),
          Divider(color: Colors.grey[300], thickness: 1),
        ],
      ),
    );
  }




  Container specification() {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.withOpacity(0.3), Colors.black.withOpacity(0.5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Highlights',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.orangeAccent,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _highlightItem('Type: Wireless Earbuds 🎧'),
              _highlightItem('Battery Life: Up to 24 hours 🔋'),
              _highlightItem('Connectivity: Bluetooth 5.0 📶'),
              _highlightItem('Water Resistance: IPX5 💧'),
              _highlightItem('Charging Time: 1.5 hours ⚡'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _highlightItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Padding description1() {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17.0),
      child: Container(
        // Apply a backdrop filter to the container
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.withOpacity(0.3), Colors.black.withOpacity(0.5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What matters for you💥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.orangeAccent,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                Text(
                  '🎧 Discover the ultimate listening experience with our Wireless Earbuds! 🎵\n\n'
                      '• Crystal clear sound quality 🔊\n'
                      '• Ergonomic and comfortable design for all-day wear 👂\n'
                      '• Long-lasting battery life 🔋\n'
                      '• Seamless Bluetooth connectivity 📶\n'
                      '• Noise-cancelling technology for uninterrupted listening 🚫🔊\n\n'
                      'Perfect for music lovers, gamers, and professionals on the go! 🌟',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }








  Row othercolrs1() {
    return Row(//other colors
      children: [
        InkWell(
          onTap: (){
            setState(() {
              black=0;
              white=0;
              blue=0;
              orange=0;
              red=1;

            });
          },
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(39),
                color: Colors.red,
                border: Border.all(
                    width: 2,
                    color: Colors.white70
                ),
                boxShadow:
                [
                  BoxShadow(
                    color: Colors.red,

                    blurRadius: red==1?26.0:0,
                    spreadRadius: red==1?2.0:0.0,
                  )
                ]
            ),


          ),
        ),
        SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () {
            setState(() {
              black = 0;
              white = 1;
              blue = 0;
              orange = 0;
              red = 0;
            });
          },
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(39),
                color: Colors.white,
                border: Border.all(
                    width: 2,
                    color: Colors.black
                ),
                boxShadow:
                [
                  BoxShadow(
                    color: Colors.white,

                    blurRadius: white==1?23.0:0,
                    spreadRadius: white==1?9:0,
                  )
                ]

            ),

          ),
        ),

      ],
    );
  }

  Container othercolrs() {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(39),
          gradient:LinearGradient(colors: [
            Colors.red,
            Colors.white60

          ]),
          border: Border.all(
              width: 2,
              color: Colors.black12
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,top: 6),
        child: Text('+2',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
      ),

    );
  }
}




