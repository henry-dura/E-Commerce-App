import 'package:flutter/material.dart';

class SearchProductTextField extends StatelessWidget {
  const SearchProductTextField({
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
        fillColor: Colors.black54,
        hintText: 'Search Product',
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          Icons.search,
          size: 35,
          color: Colors.grey,
        ),
      ),
    );
  }
}
