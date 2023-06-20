import 'package:flutter/material.dart';

import 'all_product_list.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({Key? key}) : super(key: key);

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  int TotalPrice = 0;
  int Quantitiy = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addedProducts.forEach((element) {
      TotalPrice = TotalPrice + element['price'] as int;
      Quantitiy += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: addedProducts.isNotEmpty
                  ? Column(
                      children: [
                        ...addedProducts
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.all(20),
                                height: 110,
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(e['thumbnail']),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Text("${e['price']}"),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  addedProducts.remove(e);
                                                  TotalPrice -=
                                                      e['price'] as int;
                                                });
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.redAccent),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    )
                  : Container(
                      height: 500,
                      width: 300,
                      child: Center(
                        child: Text("No Products Available"),
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                children: [
                  Text("Totle Itam : ${Quantitiy}"),
                  Text("Totle Bill : ${TotalPrice}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
