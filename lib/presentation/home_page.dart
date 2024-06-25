import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/bloc/favourite_cubit.dart';
import 'package:e_commerce_app/presentation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadSuccessState) {
              return GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 4.5),
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.products[index];
                    return GestureDetector(
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
                        color: Colors.white70.withOpacity(0.9),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Colors.black, // Border color
                            width: 2, // Border width
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.favorite,
                                      size: 30,
                                  color: favouriteCubit.state.contains(product)
                                      ? Colors.red
                                      : Colors.grey,),
                                ],
                              ),

                              Container(
                                padding: const EdgeInsets.all(3),

                                // width: 120, // Width of the border container
                                // height: 120, // Height of the border container
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black, // Border color
                                    width: 3.0, // Border width
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Hero(
                                      tag: 'image_$index',
                                      child: CachedNetworkImage(
                                        width:
                                            160, // Match the width to diameter of CircleAvatar (2 * radius)
                                        height: 160,
                                        imageUrl:
                                            '${product.image}', // Replace with your image URL
                                        fit: BoxFit
                                            .fitHeight, // BoxFit to resize and crop the image as needed
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text('${product.title}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Row(
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
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 30,
                                    // color: Colors.green,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (state is ProductErrorState) {
              return Text(state.errorMessage);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
