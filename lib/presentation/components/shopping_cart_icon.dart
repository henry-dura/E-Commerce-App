import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart_cubit.dart';
import '../../data/product_model.dart';


class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
          if (cartCubit.state
              .contains(product)) {
            cartCubit.removeFromCart(product);
          } else {
            cartCubit.addToCart(product);
          }
        });
  }
}

