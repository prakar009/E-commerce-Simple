import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier{

  final Map<int,int> _items = {};

  Map<int,int> get items => _items;

  void add(Product product){

    if(_items.containsKey(product.id)){
      _items[product.id] = _items[product.id]! + 1;
    }else{
      _items[product.id] = 1;
    }

    notifyListeners();
  }

  void increase(int id){
    _items[id] = _items[id]! + 1;
    notifyListeners();
  }

  void decrease(int id){

    if(_items[id]! > 1){
      _items[id] = _items[id]! - 1;
    }else{
      _items.remove(id);
    }

    notifyListeners();
  }

  int get count{

    int total = 0;

    _items.forEach((k,v){
      total += v;
    });

    return total;
  }

  void clear(){
    _items.clear();
    notifyListeners();
  }
}