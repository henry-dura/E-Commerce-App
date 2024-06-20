import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/data/product_repository.dart';
import 'package:flutter/material.dart';

import '../data/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List products;

  void getProducts() async {
    ProductRepository productRepository = ProductRepository();
    products = await productRepository.getProducts();
    print(products);
    print(products[1].title);
  }

  @override
  void initState() {
    super.initState();
    // Initialization tasks
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){print('Go to details Page');},
                child: Card(


                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.black, // Border color
                      width: 2, // Border width
                    ),// Set border radius here
                  ),



                  child: Column(
                    children: [
                      Container(
                        width: 250, // Adjust width as needed
                        height: 200, // Adjust height as needed
                        padding: EdgeInsets.all(30),
                        child: CachedNetworkImage(
                          imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg', // Replace with your image URL
                          fit: BoxFit.cover, // BoxFit to resize and crop the image as needed
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Text('Mens Casual Premium Slim Fit T-Shirts',style: TextStyle(fontSize: 18,)),
                      Text('\u20A6 450',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),),
                      SizedBox(height: 15,)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
