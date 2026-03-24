import '../models/user_model.dart';

class AuthService {
  // Simple Mock Credentials
  static const String mockEmail = "user@medicitas.com";
  static const String mockPassword = "admin";

  /// Simulate a backend login request
  Future<UserModel?> login(String email, String password) async {
    // 1. Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));

    // 2. Validate credentials
    if (email == mockEmail && password == mockPassword) {
      return UserModel.mock();
    } else {
      return null;
    }
  }

  /// Optional: Simulated logout
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
