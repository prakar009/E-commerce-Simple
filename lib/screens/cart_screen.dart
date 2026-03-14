import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import '../widgets/cart_item_widget.dart';
import 'checkout_success_screen.dart';

class CartScreen extends StatefulWidget{
  const CartScreen({super.key});

  @override
  State<CartScreen> createState()=>_CartScreenState();
}

class _CartScreenState extends State<CartScreen>{

  late Future<List<Product>> products;

  @override
  void initState(){
    super.initState();
    products = ApiService().getProducts();
  }

  @override
  Widget build(BuildContext context){

    final cart = Provider.of<CartProvider>(context);

    return Scaffold(

      appBar: AppBar(title: const Text("Cart")),

      body: FutureBuilder<List<Product>>(

        future: products,

        builder:(context,snapshot){

          if(!snapshot.hasData){
            return const Center(child:CircularProgressIndicator());
          }

          final items = snapshot.data!;

          if(cart.items.isEmpty){
            return const Center(child:Text("Cart Empty"));
          }

          return ListView(
            children: cart.items.entries.map((entry){

              final product =
                  items.firstWhere((p)=>p.id==entry.key);

              return CartItemWidget(
                product: product,
                quantity: entry.value,
              );

            }).toList(),
          );
        },
      ),

     bottomNavigationBar: SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: ElevatedButton(
      onPressed: (){},
      child: const Text("Proceed to Checkout"),
    ),
  ),
)
    );
  }
}