class UserEntity {
  const UserEntity({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    this.firstName,
    this.lastName,
    this.refreshToken,
    required this.id,
    required this.isActive,
  });

  final String username;
  final String password;
  final String email;
  final String phone;
  final String? firstName;
  final String? lastName;
  final String? refreshToken;
  final String id;
  final bool isActive;
}
