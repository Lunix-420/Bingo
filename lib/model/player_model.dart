class Player {
  final String name;

  Player._({required this.name});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player._(name: json['name']);
  }
}
