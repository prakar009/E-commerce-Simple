import 'package:flutter/material.dart';

class CheckoutSuccessScreen extends StatelessWidget{

  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[

            const Icon(
              Icons.check_circle,
              color:Colors.green,
              size:100,
            ),

            const SizedBox(height:20),

            const Text(
              "Order Successful",
              style: TextStyle(
                fontSize:24,
                fontWeight:FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            ElevatedButton(
              onPressed:(){
                Navigator.pop(context);
              },
              child: const Text("Continue Shopping"),
            )

          ],
        ),
      ),
    );
  }
}