import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  CustomDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Use `value` if it exists in items; otherwise, default to the first item.
    final effectiveValue = items.contains(value) ? value : items.first;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        value: effectiveValue,
        underline: SizedBox(),
        isExpanded: true, // Makes dropdown button full-width
        items: items.toSet().map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item), // Full text shown in dropdown menu
          );
        }).toList(),
        onChanged: onChanged,
        selectedItemBuilder: (BuildContext context) {
          return items.map((String item) {
            return Container(
              alignment: Alignment.centerLeft,
              child: Text(
                item == 'Alphabetical' ? 'Alphabetical A to Z' : item, // Show full "Alphabetical A to Z"
                overflow: TextOverflow.ellipsis, // Shows truncated text in dropdown button
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList();
        },
      ),
    );
  }
}

class CustomDropdownRow extends StatelessWidget {
  final String selectedGender;
  final String selectedSign;
  final String selectedSort;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onSignChanged;
  final ValueChanged<String?> onSortChanged;

  CustomDropdownRow({
    required this.selectedGender,
    required this.selectedSign,
    required this.selectedSort,
    required this.onGenderChanged,
    required this.onSignChanged,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomDropdown(
            value: selectedGender,
            items: ['Gender', 'Male', 'Female'],
            onChanged: onGenderChanged,
          ),
        ),
        SizedBox(width: screenWidth * 0.02), // Add spacing between dropdowns

        Expanded(
          child: CustomDropdown(
            value: selectedSign,
            items: [
              'Rashi',
              'Aries (A, L, E)',
              'Aquarius (G, S)',
              'Capricorn (J, K)',
              'Cancer (D, H)',
              'Gemini (G, K)',
              'Leo (M, T)',
              'Libra (R, T)',
              'Pisces (C, D, J, T)',
              'Sagittarius (B, D, P)',
              'Scorpio (N, Y)',
              'Taurus (B, U, V)',
              'Virgo (P, T)',
            ],
            onChanged: onSignChanged,
          ),
        ),
        SizedBox(width: screenWidth * 0.02), // Add spacing between dropdowns

        Expanded(
          child: CustomDropdown(
            value: selectedSort,
            items: [
              'Alphabetical', // Placeholder text
              'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
              'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
            ],
            onChanged: onSortChanged,
          ),
        ),
      ],
    );
  }
}
