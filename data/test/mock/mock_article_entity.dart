import 'dart:math';

import 'package:data/data.dart';

UserEntity get mockArticles => const UserEntity(
    id: '100000008172772',
    email: '',
    isActive: false,
    password: 'asdasd',
    phone: '+996507540275',
    username: 'username',
    firstName: '',
    lastName: '',
    refreshToken: '');

String randomString({int len = 10}) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}
