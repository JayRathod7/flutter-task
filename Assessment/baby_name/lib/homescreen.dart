import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/religion_screen.dart';
import 'custom_widgets/custom_drawer.dart';
import 'custom_widgets/custom_dropdown.dart';
import 'custom_widgets/customappbar.dart';
import 'custom_widgets/customize_listtitle.dart';
import 'custom_widgets/customize_searchandtotal.dart';
import 'Screen/favourite_screen.dart';
import 'model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedGender = "Gender";
  String selectedSign = "Rashi";
  String selectedSort = "Alphabetical";
  String selectedReligion = "Religion";
  List<Model> names = [];
  List<Model> filteredNames = [];
  bool isLoading = true;
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  List<Model> favoriteNames = [];

  @override
  void initState() {
    super.initState();
    fetchNames();
    loadFavorites();

    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // Attach the exit confirmation dialog
      child: Scaffold(
        drawer: CustomDrawer(
          onReligionSelected: openReligionSelectionDialog, // Use public method
        ),
        body: Column(
          children: [
            CustomAppBar(
              title: 'Baby Names',
              onRefreshPressed: fetchNames,
              onFavoritePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen(
                      favoriteNames: favoriteNames,
                      onFavoriteToggle: toggleFavorite,
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomDropdownRow(
                      selectedGender: selectedGender,
                      selectedSign: selectedSign,
                      selectedSort: selectedSort,
                      onGenderChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                        });
                        updateFilteredNames(query: _searchController.text);
                      },
                      onSignChanged: (String? newValue) {
                        setState(() {
                          selectedSign = newValue!;
                        });
                        updateFilteredNames(query: _searchController.text);
                      },
                      onSortChanged: (String? newValue) {
                        setState(() {
                          selectedSort = newValue!;
                        });
                        updateFilteredNames(query: _searchController.text);
                      },
                    ),
                    SizedBox(height: 16),
                    SearchAndTotalRow(
                      totalNames: filteredNames.length,
                      onSearch: updateSearchQuery,
                      searchFocusNode: _searchFocusNode,
                      searchController: _searchController,
                    ),
                  //  SizedBox(height: 2),
                    Expanded(
                      child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : filteredNames.isEmpty
                          ? Center(child: Text('No names found'))
                          : ListView.builder(
                        itemCount: filteredNames.length,
                        itemBuilder: (context, index) {
                          return CustomListTile(
                            model: filteredNames[index],
                            onFavoriteToggle: () =>
                                toggleFavorite(filteredNames[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoriteJson = prefs.getString('favoriteNames');
    if (favoriteJson != null) {
      setState(() {
        favoriteNames = (json.decode(favoriteJson) as List)
            .map((data) => Model.fromJson(data))
            .toList();
      });
    }
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String favoriteJson =
    json.encode(favoriteNames.map((name) => name.toJson()).toList());
    prefs.setString('favoriteNames', favoriteJson);
  }

  void toggleFavorite(Model model) {
    setState(() {
      model.isFavorite = !model.isFavorite;

      if (model.isFavorite) {
        if (!favoriteNames.any((fav) => fav.id == model.id)) {
          favoriteNames.add(model);
        }
      } else {
        favoriteNames.removeWhere((fav) => fav.id == model.id);
      }

      saveFavorites();
    });
  }

  Future<void> fetchNames() async {
    setState(() {
      selectedGender = "Gender";
      selectedSign = "Rashi";
      selectedSort = "Alphabetical";
      selectedReligion = "Religion"; // Reset religion filter on refresh
      _searchController.clear();
      isLoading = true; // Show loading indicator during fetch
    });

    final url = Uri.parse('https://prakrutitech.buzz/Sujal/baby_view.php');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);

        setState(() {
          names = jsonData.map((item) => Model.fromJson(item)).toList();

          // Log each name's religion for debugging
          for (var name in names) {
            print('Fetched name: ${name.name}, Religion: ${name.religion}');
          }

          for (var name in names) {
            name.isFavorite = favoriteNames.any((fav) => fav.id == name.id);
          }

          names.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
          updateFilteredNames();
          isLoading = false;
        });
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  String _extractMainRashi(String rashiText) {
    return rashiText.split(" ")[0].toLowerCase();
  }

  String getNormalizedReligion(String religion) {
    switch (religion.toLowerCase()) {
      case 'muslim':
      case 'islam':
        return 'muslim';
      case 'hindu':
        return 'hindu';
      case 'christian':
        return 'christian';
      default:
        return religion.toLowerCase();
    }
  }


  void updateFilteredNames({String query = ''}) {
    setState(() {
      // Normalize the selected religion to lowercase for consistent comparison
      String normalizedSelectedReligion = selectedReligion.toLowerCase().trim();

      // Filtering logic
      filteredNames = names.where((name) {
        // Normalize each name's religion value for comparison
        String normalizedNameReligion = name.religion?.toLowerCase().trim() ?? '';

        bool matchesGender = selectedGender == 'Gender' ||
            (name.gender != null &&
                name.gender!.toLowerCase() == selectedGender.toLowerCase());

        bool matchesRashi = selectedSign == 'Rashi' ||
            (name.rashi != null && _extractMainRashi(name.rashi!) == _extractMainRashi(selectedSign));

        bool matchesAlphabet = selectedSort == 'Alphabetical' ||
            (name.name != null &&
                name.name!.toLowerCase().startsWith(selectedSort.toLowerCase()));

        bool matchesQuery = name.name != null &&
            name.name!.toLowerCase().contains(query.toLowerCase());

        // Adjusted religion matching logic to handle case and space sensitivity
        bool matchesReligion = normalizedSelectedReligion == 'religion' ||
            normalizedNameReligion == normalizedSelectedReligion;

        return matchesGender && matchesRashi && matchesAlphabet && matchesQuery && matchesReligion;
      }).toList();

      // Debug output to verify filtering results
      print("Selected Religion: $selectedReligion");
      print("Normalized Selected Religion: $normalizedSelectedReligion");
      print("Filtered names count: ${filteredNames.length}");

      for (var name in filteredNames) {
        print("Filtered Name: ${name.name}, Religion: ${name.religion}");
      }
    });
  }

  void openReligionSelectionDialog() async {
    final String? selected = await showDialog<String>(
      context: context,
      builder: (context) => ReligionScreen(),
    );

    if (selected != null) {
      setState(() {
        selectedReligion = selected;  // Set selected religion from dialog
        print("Selected religion from dialog: $selectedReligion"); // Debug output
        updateFilteredNames(query: _searchController.text);  // Apply filter immediately
      });
    }
  }



  void updateSearchQuery(String query) {
    updateFilteredNames(query: query);
  }

  void _clearSearch() {
    _searchController.clear();
    updateSearchQuery('');
    _searchFocusNode.unfocus();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titlePadding: EdgeInsets.zero,
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.warning_rounded,
                color: Colors.redAccent,
                size: 40,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Confirm Exit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        content: Text(
          "Are you sure you want to leave the application?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade800,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actionsPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "No",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Yes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
