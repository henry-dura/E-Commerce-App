import 'package:bloc/bloc.dart';




class FavouriteCubit extends Cubit<List<dynamic>> {
  FavouriteCubit() : super([]);

  void addFavorite(dynamic product) {
    state.add(product);
    emit(List.from(state));
  }

  void removeFavorite(dynamic product) {
    state.remove(product);
    emit(List.from(state));
  }
}
