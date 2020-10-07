import 'package:cartnotifier/Screen2.dart';
import 'package:cartnotifier/model/Item.dart';
import 'package:cartnotifier/model/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AddToCart>(
    create: (_) => AddToCart(),
    child: MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class Home extends StatelessWidget {
  List<Product> prod = [
    Product("Juice", 230, 0),
    Product("Fruit", 130, 0),
    Product("Makeup", 330, 0),
    Product("Dress", 430, 0),
    Product("Scarf", 730, 0),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Notifier")),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: prod.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Provider.of<AddToCart>(context, listen: false)
                                .addProdToCart(prod[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.blueAccent, width: 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(prod[index].name),
                                    Text(
                                        "Price :${prod[index].price.toString()}"),
                                    //Check for Quantity
                                    Container(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Provider.of<AddToCart>(context,
                                                      listen: false)
                                                  .subtractQuant(prod[index]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(2),
                                              color: Colors.blue,
                                              child: Text(
                                                " - ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 6, 10, 6),
                                            child: Text(Provider.of<AddToCart>(
                                              context,
                                            )
                                                .getQuantity(prod[index])
                                                .toString()),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Provider.of<AddToCart>(context,
                                                      listen: false)
                                                  .addQuant(prod[index]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(2),
                                              color: Colors.blue,
                                              child: Text(
                                                " + ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
//                      FilterChip(
//                        selected: Provider.of<AddToCart>(context)
//                                .checkprod(prod[index])
//                            ? true
//                            : false,
//                        label: Text(prod[index].name),
//                        onSelected: (bool selected) {
////                          select[index] = !select[index];
//                          if (Provider.of<AddToCart>(context, listen: false)
//                                  .checkprod(prod[index]) ==
//                              false) {
//                            Provider.of<AddToCart>(context, listen: false)
//                                .addProdToCart(prod[index]);
//                          } else {
//                            Provider.of<AddToCart>(context, listen: false)
//                                .removeprod(prod[index]);
//                          }
//                        },
//                      );
                    },
                  )),
            ),
            FlatButton(
              color: Colors.orangeAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen2()));
              },
              child: Text("NExtt"),
            )
          ],
        ),
      ),
    );
  }
}

//class QuantityOfItem extends StatelessWidget {
//  int index;
//  QuantityOfItem(int index);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Row(
//        children: [
//          InkWell(
//            onTap: () {
//              Provider.of<AddToCart>(context, listen: false)
//                  .subtractQuant(index);
//            },
//            child: Container(
//              padding: EdgeInsets.all(2),
//              color: Colors.blue,
//              child: Text(
//                " - ",
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
//            child:
//                Text(Provider.of<AddToCart>(context).getQuantity().toString()),
//          ),
//          InkWell(
//            onTap: () {
//              Provider.of<AddToCart>(context, listen: false).addQuant(index);
//            },
//            child: Container(
//              padding: EdgeInsets.all(2),
//              color: Colors.blue,
//              child: Text(
//                " + ",
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}

//class ProductShowCase extends StatelessWidget {
//  int index;
//  Product prod;
//
//  ProductShowCase(Product prod, int index);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child:
//    );
//  }
//}
