import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    double total = product.price * quantity;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(0, 2))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(product.image, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Text("\$${product.price}",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text("Total: \$${total.toStringAsFixed(2)}",
                      style:
                          const TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cart.decrease(product.id);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.remove, size: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(quantity.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
                      onTap: () {
                        cart.increase(product.id);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.add, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    cart.decrease(product.id);
                  },
                  child:
                      const Icon(Icons.delete_outline, color: Colors.redAccent),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}