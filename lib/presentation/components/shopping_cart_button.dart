import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart_cubit.dart';
import '../../data/product_model.dart';


class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            elevation: 8
        ),
        onPressed: () {
          final cartCubit =
          context.read<CartCubit>();
          cartCubit.addToCart(product);
        },
        child: const Icon(Icons.shopping_cart_rounded,color: Colors.black,)
    );
  }
}
