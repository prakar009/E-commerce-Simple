import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget{

  final Product product;

  const ProductDetailScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context){

    final cart = Provider.of<CartProvider>(context);

    final price = (product.price * 83).toStringAsFixed(0);

    return Scaffold(

      body: CustomScrollView(

        slivers:[

          SliverAppBar(
            expandedHeight:300,
            pinned:true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(40),
                child: Image.network(product.image),
              ),
            ),
          ),

          SliverToBoxAdapter(

            child: Padding(

              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[

                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.bold
                    ),
                  ),

                  const SizedBox(height:10),

                  Text(
                    "₹$price",
                    style: const TextStyle(
                      fontSize:26,
                      fontWeight:FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height:16),

                  Text(product.description),

                  const SizedBox(height:80)

                ],
              ),
            ),
          )
        ],
      ),

      bottomNavigationBar: SafeArea(

        child: Container(

          padding: const EdgeInsets.all(12),

          child: Row(

            children:[

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange
                  ),
                  onPressed:(){

                    cart.add(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content:Text("Added to cart"))
                    );

                  },
                  child: const Text("Add to Cart"),
                ),
              ),

              const SizedBox(width:10),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                  ),
                  onPressed:(){
                    cart.add(product);
                  },
                  child: const Text("Buy Now"),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}