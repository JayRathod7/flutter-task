import 'package:flutter/material.dart';
import '../../model.dart';
import '../custom_widgets/customize_listtitle.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Model> favoriteNames;
  final Function(Model) onFavoriteToggle;

  FavoriteScreen({required this.favoriteNames, required this.onFavoriteToggle});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void _confirmRemoval(BuildContext context, Model model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Remove Favorite",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Are you sure you want to remove this name from favorites?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text("Cancel", style: TextStyle(color: Colors.black87)),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text("Remove", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          widget.onFavoriteToggle(model); // Toggle favorite status and update list
                        });
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Favorite Names",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        elevation: 4,
      ),
      body: widget.favoriteNames.isEmpty
          ? Center(child: Text("No favorite names"))
          : ListView.builder(
        itemCount: widget.favoriteNames.length,
        itemBuilder: (context, index) {
          final model = widget.favoriteNames[index];
          return CustomListTile(
            model: model,
            onFavoriteToggle: () {
              _confirmRemoval(context, model); // Show confirmation dialog
            },
          );
        },
      ),
    );
  }
}
