import 'package:e_commerce_app/bloc/cart_cubit.dart';
import 'package:e_commerce_app/bloc/favourite_cubit.dart';
import 'package:e_commerce_app/presentation/components/products_display_logic.dart';
import 'package:e_commerce_app/presentation/pages/favourites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product_bloc.dart';
import 'carted_page.dart';
import '../components/actions_icon_stack.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    // Initialization tasks
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(ProductLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Herox Stores',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          actions: const [
            ActionsIconStack<FavouriteCubit>(iconName: Icons.favorite,linkedPage: FavouritesPage(),),
            ActionsIconStack<CartCubit>(iconName: Icons.shopping_cart,linkedPage: CartPage(),)
          ],
          bottom: TabBar(
            isScrollable: true,
            indicator: BoxDecoration(
                color: Colors.green, // Change to your desired button color
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle
                // Makes the indicator look like a button
                ),
            labelStyle: const TextStyle(fontSize: 18),
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            tabs: const <Widget>[
              Tab(text: ' All Products '),
              Tab(text: ' Electronics '),
              Tab(text: ' Men Clothing '),
              Tab(text: ' Women Clothing '),
              Tab(text: ' Jewelry '),



            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: const TabBarView(children: [
            ProductsDisplayLogic(),
            ProductsDisplayLogic(category: "electronics"),
            ProductsDisplayLogic(category: "men's clothing"),
            ProductsDisplayLogic(category: "women's clothing"),
            ProductsDisplayLogic(category: "jewelery"),



          ]),
        ),
      ),
    );
  }
}

