import 'package:flutter/material.dart';

class SearchCityTextField extends StatelessWidget {
  const SearchCityTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorHeight: 20,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70, width: 2),
        ),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.black,
        hintText: 'Search City',
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(
          Icons.search,
          size: 35,
          color: Colors.grey,
        ),
      ),
    );
  }
}
