
import 'package:e_commerce_app/data/product_model.dart';

class CartedProductModel {
  final ProductModel product;
  int quantity;


  CartedProductModel({required this.product,  this.quantity = 0,});

   get totalPrice => product.price * quantity;

  factory CartedProductModel.fromJson(Map<String, dynamic> json) {
    return CartedProductModel(
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

}