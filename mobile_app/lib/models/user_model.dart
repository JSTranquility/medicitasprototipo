class UserModel {
  final String id;
  final String email;
  final String name;
  final String? profilePhoto;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.profilePhoto,
  });

  // Example factory for mock data
  factory UserModel.mock() {
    return UserModel(
      id: 'mock_uid_123',
      email: 'user@medicitas.com',
      name: 'Dr. John Doe',
    );
  }
}
