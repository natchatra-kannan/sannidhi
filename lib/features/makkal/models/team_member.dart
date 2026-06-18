class TeamMember {
  const TeamMember({
    required this.name,
    required this.role,
    required this.email,
    required this.bio,
  });

  final String name;
  final String role;
  final String email;
  final String bio;

  String get initials {
    final parts = name.split(' ');
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return parts.take(2).map((part) => part.substring(0, 1).toUpperCase()).join();
  }
}
