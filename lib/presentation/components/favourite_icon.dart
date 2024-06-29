
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite_cubit.dart';
import '../../data/product_model.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
        FavouriteCubit favouriteCubit = context.read<FavouriteCubit>();
        if (favouriteCubit.state
            .contains(product)) {
          favouriteCubit.removeFavorite(product);
        } else {
          favouriteCubit.addFavorite(product);
        }
      },
    );
  }
}

