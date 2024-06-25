import 'package:e_commerce_app/data/product_Api_provider.dart';
import 'package:e_commerce_app/data/product_model.dart';

class ProductRepository{

  final ProductApiProvider productApiProvider = ProductApiProvider();

  Future <List<ProductModel>> getAllProducts() async => await productApiProvider.fetchProducts();

  Future <void> addProduct(ProductModel product) async => await productApiProvider.addProduct(product);

  Future <void> deleteProduct(int id) async => await productApiProvider.deleteProduct(id);


}