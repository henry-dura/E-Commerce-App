import 'package:e_commerce_app/bloc/favourite_cubit.dart';
import 'package:flutter/material.dart';
import '../components/product_listView.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites',style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:const ProductsListView<FavouriteCubit>(),
    );
  }
}
