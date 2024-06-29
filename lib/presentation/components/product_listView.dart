import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart_cubit.dart';
import '../../bloc/favourite_cubit.dart';
import '../../data/product_model.dart';
import '../details_page.dart';
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
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            tag: 'image_$index',
                            imageUrl: '${product.image}',
                            description: '${product.description}',
                          )),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    elevation: 5,
                    color: Colors.white,
                    child: ListTile(
                      // tileColor: Colors.red,
                      leading: Hero(
                        tag: 'image_$index',
                        child: CachedNetworkImage(
                          width: 100,
                          height: 150,
                          imageUrl:
                          '${product.image}', // Replace with your image URL
                          fit: BoxFit
                              .fitHeight, // BoxFit to resize and crop the image as needed
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                      title: Text('${product.title}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\u20A6 ${product.price}',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.green),
                          ),
                          ShoppingCartIcon(product: product)
                        ],
                      ),
                      trailing: FavouriteIcon(product: product),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            );
          }),
    );
  }
}

