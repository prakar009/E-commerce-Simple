import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartBadge extends StatelessWidget {

  const CartBadge({super.key});

  @override
  Widget build(BuildContext context){

    final cart = Provider.of<CartProvider>(context);

    return Stack(
      children: [

        const Icon(Icons.shopping_cart,size:28),

        if(cart.count > 0)
        Positioned(
          right:0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              cart.count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize:10,
              ),
            ),
          ),
        )
      ],
    );
  }
}