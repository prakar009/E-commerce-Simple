import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import '../models/product_model.dart';
import 'product_detail_screen.dart';
import '../widgets/cart_badge.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  late Future<List<Product>> products;

  @override
  void initState(){
    super.initState();
   products = ApiService().getProducts();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      body: FutureBuilder<List<Product>>(

        future: products,

        builder:(context,snapshot){

          if(!snapshot.hasData){
            return const Center(child:CircularProgressIndicator());
          }

          final items = snapshot.data!;

          return CustomScrollView(

            slivers:[

              SliverAppBar(
                pinned:true,
                backgroundColor: Colors.orange,
                title: const Text("Amazon Style Shop"),
                actions:[
                  IconButton(
                    icon: const CartBadge(),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:(_)=>const CartScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),

              SliverPadding(

                padding: const EdgeInsets.all(10),

                sliver: SliverGrid(

                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    crossAxisSpacing:10,
                    mainAxisSpacing:10,
                    childAspectRatio:.70,
                  ),

                  delegate: SliverChildBuilderDelegate(

                    (context,index){

                      final product = items[index];

                      return ProductCard(
                        product: product,
                        onTap:(){

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:(_)=>ProductDetailScreen(product:product),
                            ),
                          );

                        },
                      );
                    },

                    childCount: items.length,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}