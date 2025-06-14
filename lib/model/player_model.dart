class Player {
  final String name;
  final String id;

  Player._({required this.name, required this.id});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player._(name: json['name'], id: json['_id']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, '_id': id};
  }

  factory Player() {
    return Player._(name: "", id: "");
  }
}
