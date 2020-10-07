import 'package:cartnotifier/model/Item.dart';
import 'package:flutter/cupertino.dart';

class AddToCart extends ChangeNotifier {
  int _count = 0;

  List<Product> products = [];

  void addProdToCart(Product prod) {
    products.add(prod);
    notifyListeners();
  }

  bool checkprod(Product prod) {
    if (products.contains(prod)) {
      notifyListeners();
      return true;
    }
    return false;
  }

  void removeprod(Product prod) {
    if (products.contains(prod)) {
      products.remove(prod);
      notifyListeners();
    }
  }

  List<Product> showCartProducts() {
    return this.products;
  }

  void setQuant(int index, int quan) {
    products[index].quantity = quan;
    notifyListeners();
  }
//  bool productContains()

  void addQuant(Product prod) {
    if (products.contains(prod)) {
      int index = products.indexOf(prod);
      products[index].quantity = products[index].quantity + 1;
      setQuant(index, products[index].quantity);
    }

//    notifyListeners();
  }

  void subtractQuant(Product prod) {
    if (products.contains(prod)) {
      int index = products.indexOf(prod);
      if (products[index].quantity == 0) {
        products[index].quantity = 0;
        setQuant(index, products[index].quantity);
      }
      products[index].quantity = products[index].quantity - 1;
      setQuant(index, products[index].quantity);
      notifyListeners();
    }
//
  }

  //Getters
  int getQuantity(Product prod) {
    if (products.contains(prod)) {
      int index = products.indexOf(prod);
      return products[index].quantity;
    }

    return 0;
  }
}
