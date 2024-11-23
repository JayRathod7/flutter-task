import 'package:flutter/material.dart';

class SearchAndTotalRow extends StatelessWidget {
  final int totalNames;
  final Function(String) onSearch;
  final FocusNode searchFocusNode;
  final TextEditingController searchController;

  SearchAndTotalRow({
    required this.totalNames,
    required this.onSearch,
    required this.searchFocusNode,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.02;

    return Row(
      children: [
        // Search bar
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              focusNode: searchFocusNode,
              controller: searchController,
              onChanged: onSearch,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                // Show clear button only when there is text
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    searchController.clear(); // Clear text
                    onSearch(''); // Reset search results
                    searchFocusNode.unfocus(); // Close the keyboard
                  },
                )
                    : null,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        // Total names counter
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            'Total: $totalNames',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ),
      ],
    );
  }
}
