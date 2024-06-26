import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/bloc/cart_cubit.dart';
import 'package:e_commerce_app/bloc/favourite_cubit.dart';
import 'package:e_commerce_app/presentation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_cubit.dart';
import '../bloc/cart_cubit.dart';
import '../bloc/cart_cubit.dart';
import '../bloc/product_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductBloc productBloc;
  int likesCount = 4;

  @override
  void initState() {
    super.initState();
    // Initialization tasks
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(ProductLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    FavouriteCubit favouriteCubit = BlocProvider.of<FavouriteCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'All Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Background Container
              Container(
                width: 75,
                // height: 200,
                color: Colors.white,
              ),

              // Like Icon
              const Positioned(
                top: 10,
                right: 30,
                child: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Colors.redAccent,
                ),
              ),

              // Likes Count Container
              Positioned(
                bottom: 25,
                right: 0,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 40, maxHeight: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      '10',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              // Background Container
              Container(
                width: 75,
                // height: 200,
                color: Colors.white,
              ),

              // Like Icon
              const Positioned(
                top: 10,
                right: 30,
                child: Icon(
                  Icons.shopping_cart,
                  size: 40,
                  color: Colors.green,
                ),
              ),

              // Likes Count Container
              Positioned(
                bottom: 25,
                right: 0,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 40, maxHeight: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      '10',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadSuccessState) {
            return Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.products[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondPage(
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
                                // onPressed: (){print('no navigation');},
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
                        SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  }),
            );
          } else if (state is ProductErrorState) {
            return Text(state.errorMessage);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
