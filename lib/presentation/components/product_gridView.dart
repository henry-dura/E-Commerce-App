import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/product_model.dart';
import '../pages/details_page.dart';
import 'favourite_icon.dart';
import 'shopping_cart_button.dart';


class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // crossAxisSpacing: 3,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 2),
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        tag: 'image_$index',
                        imageUrl: '${product.image}',
                        description: '${product.description}',
                        title: '${product.title}',
                      )),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Adjust the radius here
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [Container(
                        padding: const EdgeInsets.only(top: 20),
                        width: 180,
                        height:100,
                        child: Hero(
                          tag: 'image_$index',
                          child: CachedNetworkImage(
                            // width: 100,
                            // height: 150,
                            imageUrl:
                            '${product.image}', // Replace with your image URL
                            fit: BoxFit
                                .fitHeight, // BoxFit to resize and crop the image as needed
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                        Positioned(
                          top: 0,
                          right: -10,
                          child: FavouriteIcon(product: product)
                        ),
                      ],

                    ),
                    Text('${product.title?.substring(0, 15)}...',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '\u20A6 ${product.price}',
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.green),
                        ),

                        ShoppingCartButton(product: product),


                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

