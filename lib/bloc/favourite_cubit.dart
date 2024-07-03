import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../data/product_model.dart';




class FavouriteCubit extends HydratedCubit<List<ProductModel>> {
  FavouriteCubit() : super([]);

  void addFavorite(dynamic product) {
    state.add(product);
    emit(List.from(state));
  }

  void removeFavorite(dynamic product) {
    state.remove(product);
    emit(List.from(state));
  }

  @override
  List<ProductModel>? fromJson(Map<String, dynamic> json) {
    final List<dynamic> jsonList = json['favourites'] as List<dynamic>;
    return jsonList.map((jsonItem) => ProductModel.fromJson(jsonItem)).toList();
  }

  @override
  Map<String, dynamic>? toJson(List<ProductModel> state) {
    final List<Map<String, dynamic>> jsonList = state.map((item) => item.toJson()).toList();
    return {'favourites': jsonList};
  }
}
