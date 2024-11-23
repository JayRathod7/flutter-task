class Model {
  String? id;
  String? name;
  String? meaning;
  String? gender;
  String? religion;
  String? rashi;
  bool isFavorite;

  Model({
    this.id,
    this.name,
    this.meaning,
    this.gender,
    this.religion,
    this.rashi,
    this.isFavorite = false,
  });

  // Updated fromJson to handle isFavorite with a default value
  Model.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        meaning = json['meaning'],
        gender = json['gender'],
        religion = json['religion'],
        rashi = json['rashi'],
        isFavorite = json['isFavorite'] ?? false; // Ensure isFavorite defaults to false if null

  // Updated toJson to include isFavorite
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['meaning'] = this.meaning;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['rashi'] = this.rashi;
    data['isFavorite'] = this.isFavorite; // Add isFavorite
    return data;
  }
}
