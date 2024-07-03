import 'package:e_commerce_app/bloc/cart_cubit.dart';
import 'package:e_commerce_app/data/cart_product_model.dart';
import 'package:e_commerce_app/presentation/pages/order_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



const kHeadingStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carted Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<CartCubit, List<CartedProductModel>>(
        builder: (context, state) {
          return state.isEmpty
              ? const Center(
                  child: Text(
                  'No Item Added  to Cart',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ))
              : Column(
                  children: [
                    Expanded(
                      child: DataTable(
                        columns: const [
                          DataColumn(
                              label: Text(
                            'Products',
                            style: kHeadingStyle,
                          )),
                          DataColumn(
                              label: Text(
                            'Qty',
                            style: kHeadingStyle,
                          )),
                          DataColumn(
                              label: Text(
                            'Price',
                            style: kHeadingStyle,
                          )),
                          DataColumn(
                              label: Text(
                            'Action',
                            style: kHeadingStyle,
                          )),
                        ],
                        rows: state.map((item) {
                          return DataRow(cells: [
                            DataCell(Text(item.product.title!.substring(0, 11))),
                            DataCell(Text('${item.quantity}')),
                            DataCell(Text('\u20A6${item.totalPrice}')),
                            DataCell(IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                int index = state.indexOf(item);

                                cartCubit.removeFromCart(index);
                                // Remove item from checkout
                              },
                            )),
                          ]);
                        }).toList()
                          ..add(DataRow(cells: [
                            const DataCell(Text('Total', style: kHeadingStyle)),
                            const DataCell(Text('')),
                            DataCell(Text(
                                '\u20A6${cartCubit.getTotalPrice().toStringAsFixed(2)}',
                                style: kHeadingStyle)),
                            const DataCell(Text('')),
                          ])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                            backgroundColor: Colors.black // Background color
                            ),
                        onPressed: () {
                          if (state.isNotEmpty) {
                            cartCubit.clearCart();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const OrderSuccessful(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Place Order',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
