part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState{}

final class ProductLoadSuccessState extends ProductState{
  final List <ProductModel>products;

  ProductLoadSuccessState(this.products);
}

final class ProductErrorState extends ProductState{
  final String errorMessage;

  ProductErrorState(this.errorMessage);


}


