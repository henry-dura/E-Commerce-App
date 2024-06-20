import 'package:e_commerce_app/data/product_Api_provider.dart';
import 'package:e_commerce_app/data/product_model.dart';

class ProductRepository{

  final ProductApiProvider productApiProvider = ProductApiProvider();

  Future getProducts() async {
    return await productApiProvider.fetchProducts();
  }
}