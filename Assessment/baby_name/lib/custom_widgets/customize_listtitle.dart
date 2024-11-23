import 'package:flutter/material.dart';
import '../model.dart';

class CustomListTile extends StatelessWidget {
  final Model model;
  final VoidCallback onFavoriteToggle;

  CustomListTile({required this.model, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      elevation: 3.0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey[300],
          child: Text(
            model.name?.substring(0, 1).toUpperCase() ?? "N/A",
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
        title: Text(
          model.name ?? "Unknown",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
        ),
        subtitle: Text(
          model.gender ?? "No gender available",
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: IconButton(
          icon: Icon(
            model.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.blueAccent,
          ),
          onPressed: onFavoriteToggle,
        ),
        onTap: () {
          _showDetailDialog(context, model);
        },
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Model model) {
    final isBoy = model.gender?.toLowerCase() == "male";
    final Color backgroundColor = isBoy ? Colors.blue.shade50 : Colors.pink.shade50;
    final Color textColor = isBoy ? Colors.blue.shade700 : Colors.pink.shade700;
    final Color iconColor = isBoy ? Colors.blue : Colors.pink;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.name ?? "Unknown",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  model.meaning ?? "No meaning available",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                _buildDetailRow(iconColor, Icons.person, "Gender", model.gender),
                _buildDetailRow(iconColor, Icons.explore, "Religion", model.religion),
                _buildDetailRow(iconColor, Icons.star, "Rashi", model.rashi),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isBoy ? Colors.blueAccent : Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(Color iconColor, IconData icon, String label, String? value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          SizedBox(width: 10),
          Text(
            "$label: ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
          ),
          Flexible(
            child: Text(
              value ?? "N/A",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
