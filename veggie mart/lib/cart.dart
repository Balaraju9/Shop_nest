import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  const Cart({required List sendingtocart,required List sendingtocart1,required List sendingtocart2});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  String secretdiscountcode = "balusuchendraBalarajuSuchendra";

  String discountcode = "";
  int received = 0;
  // Initialize counts for each item
  List<String> cartItems = ["no cart items"];
  List<String> cartImages=["no"];
  List<String> cartItemsprice = ["no price"];
  late List<int> countOfItems;
  void initState() {
    super.initState();
    _loadFavorites();
  }
    int totalrupees=0;

  List<String> imgfronpre = [];

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cartItems = prefs.getStringList('sendingtocart') ?? ["no cart items"];
      cartItemsprice=prefs.getStringList('sendingtocart1') ?? ["no cart items"];
      cartImages=prefs.getStringList('sendingtocart2') ?? ["no cart items"];


   countOfItems=List.generate(cartItems.length, (index) => 1);

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white60,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.withOpacity(0.2), Colors.purple.withOpacity(0.4)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Center(

          child: Text(
            'My Cart',
            style: TextStyle(
              fontSize: 29,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 5.0),
        //   child: Container(
        //     height: 10,
        //     width: 32,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(40),
        //       color: Colors.black12,
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 9.0),
        //       child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 26),
        //     ),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [

            addedtocartitems(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 360,
              width: 445,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(29), topLeft: Radius.circular(36)),
                gradient:  LinearGradient(
                  colors: [Colors.blue.withOpacity(0.5), Colors.purple.withOpacity(0.5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  //checkout section
                  children: [
                    SizedBox(
                      height: 70,
                    ),

                Container(
                height: 55,
                width: 370,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          onChanged: (Text) {
                            discountcode = Text;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Discount Code",
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            prefixIcon: Icon(Icons.code, color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 27,
                        width: 2,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (discountcode.length >= 1 && secretdiscountcode.contains(discountcode)) {
                              totalrupees = 1;
                              showDialog(
                                context: context,
                                builder: (context) => BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: AlertDialog(

                                    shape: RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: Colors.white70,
                                    title: Text(
                                      "Discount Code Status",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    content: Text(
                                      "Applied Successfully",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 30,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: Navigator.of(context).pop,
                                        child: Text(
                                          'ok',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: Navigator.of(context).pop,
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: Colors.white.withOpacity(0.8),
                                    title: Text(
                                      "Discount Code Status",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    content: Text(
                                      "Please Try another Code.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                        fontSize: 30,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: Navigator.of(context).pop,
                                        child: Text(
                                          'ok',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: Navigator.of(context).pop,
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            'Subtotal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0),
                          child: Text(
                            totalrupees==1?"0":cartItemsprice[0]
                           ,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 34.0, right: 39, top: 29),
                      child: Divider(
                        height: 2,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0, top: 39),
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0, top: 39),
                          child: Text(
                            totalrupees==1?"                0 \n + GST : 200":"           "+cartItemsprice[0] + "( Rupees) \n                 + GST : 200",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      width: 370,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white70

                        ),
                        borderRadius: BorderRadius.circular(60),
                        gradient: LinearGradient(
                          colors: [Colors.black12, Colors.black12],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.transparent
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 118.0, top: 7),
                              child: Text(
                                "CheckOut",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black45,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container addedtocartitems() {
    return Container(
      height: 450,
      width: 600,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [Colors.blue.withOpacity(0.5), Colors.purple.withOpacity(0.5)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),

      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: cartItems[0]=="no cart items"?Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: 130,
                width: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white30.withOpacity(0.1), // Adjust opacity to suit the glass effect
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Container(
                        height: 420,
                        width:570,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),

                          child: Image.network("assets/cartitem.jpeg", fit: BoxFit.fill),
                        ),
                      ),
                    ),





                  ],
                ),
              ),
            ),
          )

      ):ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 130,
                  width: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white30.withOpacity(0.1), // Adjust opacity to suit the glass effect
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 14),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.network(cartImages[index], fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 140,
                        child: Text(
                          cartItems[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 140,
                        child: Text(
                          "Electronics",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 140,
                        child: Text(
                          cartItemsprice[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        left: 320,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if(cartItems.length==1){
                                cartItems[0]="no cart items";
                              }
                              else {
                                cartItems.removeAt(index);
                                countOfItems.removeAt(index);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.orange,
                            size: 37,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 85,
                        left: 250,
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    countOfItems[index]++;
                                  });
                                },
                                icon: Icon(Icons.add),
                                color: Colors.black,
                              ),
                              Text(
                                "${countOfItems[index]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 23,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (countOfItems[index] > 0) {
                                      countOfItems[index]--;
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: countOfItems[index] > 9 ? 9 : 21, top: 12),
                                  child: Container(
                                    height: 3,
                                    width: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          );
        },
      ),
    );
  }
}
