class DataModel {
  int? id;
  String? name;
  String? desc;
  String? date;
  String? time;
  int? priority;
  bool isDone;

  DataModel(
      {this.id,
      this.name,
      this.desc,
      this.date,
      this.time,
      this.priority,
      this.isDone = false});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['desc'] = desc;
    data['date'] = date;
    data['time'] = time;
    data['priority'] = priority;
    data['isDone'] = isDone! ? 1 : 0;
    return data;
  }

  factory DataModel.fromJson(Map<String, dynamic> map) {
    return DataModel(
        id: map['id'],
        name: map['name'],
        desc: map['desc'],
        date: map['date'],
        time: map['time'],
        priority: map['priority'],
        isDone: map["isDone"] == 1);
  }
}
