// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  const UserModel({
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

  UserModel copyWith({
    String? username,
    String? password,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    String? refreshToken,
    String? id,
    bool? isActive,
  }) {
    return UserModel(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      refreshToken: refreshToken ?? this.refreshToken,
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'refreshToken': refreshToken,
      'id': id,
      'isActive': isActive,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      id: map['id'] as String,
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticleModel(username: $username, password: $password, email: $email, phone: $phone, firstName: $firstName, lastName: $lastName, refreshToken: $refreshToken, id: $id, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.email == email &&
        other.phone == phone &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.refreshToken == refreshToken &&
        other.id == id &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        refreshToken.hashCode ^
        id.hashCode ^
        isActive.hashCode;
  }
}
