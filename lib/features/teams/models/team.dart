class Team {
  final int id;
  final String name;
  final String? description;

  Team({
    required this.id,
    required this.name,
    this.description,
  });

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}