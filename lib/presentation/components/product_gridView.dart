import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/product_model.dart';
import '../pages/details_page.dart';
import 'favourite_icon.dart';
import 'shopping_cart_icon.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
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
              crossAxisSpacing: 5,
              mainAxisSpacing: 15,
              childAspectRatio: 2 / 3),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 140,
                      height:210,
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
                    Text('${product.title?.substring(0, 15)}...',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\u20A6 ${product.price}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.green),
                        ),
                        ShoppingCartIcon(product: product),
                        FavouriteIcon(product: product)
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
