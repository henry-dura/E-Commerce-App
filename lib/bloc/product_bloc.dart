import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/product_model.dart';
import 'package:meta/meta.dart';

import '../data/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc(this._productRepository) : super(ProductLoadingState()) {

    on<ProductLoadEvent>((event, emit) async{
      emit(ProductLoadingState());
      try {
        final products = await _productRepository.getAllProducts();

        emit(ProductLoadSuccessState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });


    on<ProductAddEvent>((event, emit) async{

      try {
        await _productRepository.addProduct(event.product);
        add(ProductLoadEvent());
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });

    on<ProductDeleteEvent>((event, emit) async{

      try {
        await _productRepository.deleteProduct(event.id);
        add(ProductLoadEvent());
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });




  }






}
