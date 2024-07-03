import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/presentation/components/shopping_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/details_page.dart';
import 'favourite_icon.dart';


class ProductsListView<C extends Cubit<List<dynamic>>> extends StatelessWidget {
  const ProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, List<dynamic>>(
      builder: (context, state) {
        return state.isEmpty ?const Center(
            child: Text(
              'No Item Added  to Favourites',
              style: TextStyle(
                fontSize: 25,
              ),
            )):ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              final product = state[index];
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
                              title: '${product.title}',
                            )),
                      );
                    },
                    child: SizedBox(
                      height: 100,
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
                          title: Text('${product.title?.substring(0, 15)}...',
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
                              ShoppingCartButton(product: product)
                            ],
                          ),
                          trailing: FavouriteIcon(product: product,),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              );
            });
      },
    );
  }
}
