import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/product_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../data/cart_product_model.dart';



class CartCubit extends HydratedCubit<List<CartedProductModel>> {
  CartCubit() : super([]);

  void addToCart(ProductModel product) {
    var item = state.firstWhere((item) => item.product == product, orElse: () => CartedProductModel(product: product));
    if (item.quantity == 0) {
      state.add(item);

    }
      item.quantity++;


    // state.add(CartedProductModel(product: product));
    emit(List.from(state));
  }

  void removeFromCart(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }

  double getTotalPrice() {
    return state.fold(0.0, (currentTotal, prod) => currentTotal + prod.totalPrice);
  }

  int getTotalProductInCart(){
    return state.fold(0,(quantity, prod)=> quantity + prod.quantity);
  }

  void clearCart(){
    state.clear();
    emit(List.from(state));

  }


  @override
  List<CartedProductModel>? fromJson(Map<String, dynamic> json) {
    final List<dynamic> jsonList = json['cart'] as List<dynamic>;
    return jsonList.map((jsonItem) => CartedProductModel.fromJson(jsonItem)).toList();
  }

  @override
  Map<String, dynamic>? toJson(List<CartedProductModel> state) {
    final List<Map<String, dynamic>> jsonList = state.map((item) => item.toJson()).toList();
    return {'cart': jsonList};
  }



}


