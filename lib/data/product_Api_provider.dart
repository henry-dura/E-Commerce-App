import 'package:e_commerce_app/data/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const String _baseUrl = 'https://fakestoreapi.com';

class ProductApiProvider{


  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }


}