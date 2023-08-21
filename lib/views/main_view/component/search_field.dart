import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final searchController = TextEditingController();
  SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade800,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        suffixIcon: const Icon(Icons.menu_outlined),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
