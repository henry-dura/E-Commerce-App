import 'package:e_commerce_app/data/product_model.dart';
import 'package:e_commerce_app/presentation/components/product_gridView.dart';
import 'package:e_commerce_app/presentation/components/search_product_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product_bloc.dart';

class ProductsDisplayLogic extends StatelessWidget {
  final String category;
  const ProductsDisplayLogic({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());

        } else if (state is ProductLoadSuccessState) {
          List<ProductModel> products = category == "All"
              ? state.products
              : state.products.where((product) => product.category == category).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const SearchProductTextField(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'WE GIVE THE BEST PRICES',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 15
              ),
              ProductGridView(products: products),
            ],
          );
        } else if (state is ProductErrorState) {
          return Text(state.errorMessage,style: const TextStyle(color: Colors.red),);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

