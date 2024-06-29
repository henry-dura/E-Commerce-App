import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/bloc/favourite_cubit.dart';
import 'package:e_commerce_app/presentation/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_cubit.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites',style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:BlocBuilder<FavouriteCubit, List<dynamic>>(
  builder: (context, state) {
    return ListView.builder(
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
                          IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: context
                                    .watch<CartCubit>()
                                    .state
                                    .contains(product)
                                    ? Colors.black
                                    : Colors.grey,
                                // color: Colors.green,
                              ),
                              onPressed: () {
                                final cartCubit =
                                context.read<CartCubit>();
                                if (cartCubit.state.contains(product)) {
                                  cartCubit.removeFromCart(product);
                                } else {
                                  cartCubit.addToCart(product);
                                }
                              })
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: context
                              .watch<FavouriteCubit>()
                              .state
                              .contains(product)
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: () {
                          FavouriteCubit favouriteCubit = context.read<FavouriteCubit>();
                          if (favouriteCubit.state.contains(product)) {
                            favouriteCubit.removeFavorite(product);
                          } else {
                            favouriteCubit.addFavorite(product);
                          }
                        },
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
),
    );
  }
}
