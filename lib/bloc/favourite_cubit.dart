import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

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
