import 'package:bloc/bloc.dart';


class CartCubit extends Cubit<List<dynamic>> {
  CartCubit() : super([]);

  void addToCart(dynamic product) {
    state.add(product);
    emit(List.from(state));
  }

  void removeFromCart(dynamic product) {
    state.remove(product);
    emit(List.from(state));
  }
}


