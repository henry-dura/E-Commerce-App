part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}



class ProductLoadEvent extends ProductEvent{}

class ProductAddEvent extends ProductEvent{
  final ProductModel product;

  ProductAddEvent(this.product);
}

class ProductDeleteEvent extends ProductEvent{
  final int id;

  ProductDeleteEvent(this.id);
}

