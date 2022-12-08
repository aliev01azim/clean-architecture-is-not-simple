// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String? firstName;
  final String? lastName;
  final String password;
  final String email;
  final String phone;
  final String activationCode;
  final String? refreshToken;
  final String? accessToken;
  final String id;
  final bool isActive;

  const UserModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.phone,
    required this.activationCode,
    required this.refreshToken,
    required this.accessToken,
    required this.id,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        username,
        firstName,
        lastName,
        password,
        email,
        phone,
        activationCode,
        refreshToken,
        id,
        isActive,
        accessToken,
      ];

  factory UserModel.fromJson(map) {
    return UserModel(
      username: map['username'] as String,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      password: map['password'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      activationCode: map['activationCode'] as String,
      refreshToken: map['refreshToken'] as String?,
      accessToken: map['accessToken'] as String?,
      id: map['id'] as String,
      isActive: map['isActive'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
      'phone': phone,
      'activationCode': activationCode,
      'refreshToken': refreshToken,
      'id': id,
      'isActive': isActive,
      'accessToken': accessToken,
    };
  }
}
