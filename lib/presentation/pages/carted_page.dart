import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/bloc/cart_cubit.dart';
import 'package:e_commerce_app/presentation/components/favourite_icon.dart';
import 'package:e_commerce_app/presentation/components/shopping_cart_icon.dart';
import 'package:e_commerce_app/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite_cubit.dart';
import '../components/product_listView.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carted Products',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: const ProductsListView<CartCubit>(),
    );
  }
}

