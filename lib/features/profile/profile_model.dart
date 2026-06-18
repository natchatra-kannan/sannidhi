class ProfileModel {
  final String id;
  final String email;
  final String? fullName;
  final String? photoUrl;
  final int coinsReceived;
  final int coinsSent;
  final int coinsDeducted;

  ProfileModel({
    required this.id,
    required this.email,
    this.fullName,
    this.photoUrl,
    required this.coinsReceived,
    required this.coinsSent,
    required this.coinsDeducted,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      email: map['email'],
      fullName: map['full_name'],
      photoUrl: map['photo_url'],
      coinsReceived: map['coins_received'] ?? 0,
      coinsSent: map['coins_sent'] ?? 0,
      coinsDeducted: map['coins_deducted'] ?? 0,
    );
  }
}