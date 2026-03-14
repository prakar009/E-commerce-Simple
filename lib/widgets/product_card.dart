import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget{

  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){

    final price = (product.price * 83).toStringAsFixed(0);

    return GestureDetector(

      onTap: onTap,

      child: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow:[
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius:6,
            )
          ]
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children:[

            Expanded(
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.contain,
                placeholder:(c,s)=>const Center(child:CircularProgressIndicator()),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                product.title,
                maxLines:2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8),
              child: Text(
                "₹$price",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:16,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal:8),
              child: Text(
                "FREE Delivery",
                style: TextStyle(
                  color: Colors.green,
                  fontSize:12
                ),
              ),
            ),

            const SizedBox(height:6)

          ],
        ),
      ),
    );
  }
}