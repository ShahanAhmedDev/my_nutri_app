import 'package:flutter/material.dart';
import 'package:my_nutri_app/utils/resources/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String)? onSearchSubmitted;

  CustomSearchBar({Key? key, required this.searchController, this.onSearchSubmitted}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
      ),
      child: TextField(
        controller: widget.searchController,
        onSubmitted: widget.onSearchSubmitted, // This line is added
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search, color: Colors.black,),
          hintText: "Search for anything...!",
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
