import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/addtocart.dart';

class Screen2 extends StatelessWidget {
  AddToCart addTocart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen2"),
      ),
      body: Container(
        child: Center(
            child: ListView.builder(
          itemCount: Provider.of<AddToCart>(context).showCartProducts().length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Text(
                  Provider.of<AddToCart>(context)
                      .showCartProducts()[index]
                      .name,
                  //phone me hai
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  Provider.of<AddToCart>(context)
                      .showCartProducts()[index]
                      .quantity
                      .toString(),
                  //phone me hai
                  style: TextStyle(fontSize: 10),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
