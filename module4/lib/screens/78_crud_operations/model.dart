// class DataModel {
//   final String id;
//   final String name;
//   final String number;
//   final String email;
//   final String sid;
//
//   DataModel({
//     required this.id,
//     required this.name,
//     required this.number,
//     required this.email,
//     required this.sid,
//   });
// }

class DataModel {
  int? id;
  String? name;
  String? number;
  String? email;
  String? sid;

  DataModel({this.id, this.name, this.number, this.email, this.sid});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    email = json['email'];
    sid = json['sid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['email'] = email;
    data['sid'] = sid;
    return data;
  }
}
