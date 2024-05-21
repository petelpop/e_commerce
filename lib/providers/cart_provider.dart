import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void toggleFavorite(Product product){
    if(_cart.contains(product)){
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQtn(int index) => _cart[index].quantity++;
  decrementQtn(int index) {
    if(_cart[index].quantity != 1){
    _cart[index].quantity--;
      }
    }
  
  static CartProvider of(BuildContext context, {
    bool listen = true
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen
    );
  }
}