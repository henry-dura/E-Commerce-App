import 'package:e_commerce_app/data/product_repository.dart';
import 'package:e_commerce_app/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart_cubit.dart';
import 'bloc/favourite_cubit.dart';
import 'bloc/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(ProductRepository())),
        BlocProvider(
          create: (context) => FavouriteCubit()),
        BlocProvider(
            create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black26,
        ),
        home: const Home(),
      ),
    );
  }
}

