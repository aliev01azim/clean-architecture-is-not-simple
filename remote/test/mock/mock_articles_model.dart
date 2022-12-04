import 'dart:math';

import 'package:data/data.dart';
import 'package:remote/src/models/article/auth_response_model.dart';

AuthResponseModel get mockUserResponseModel =>
    AuthResponseModel(status: randomString(), data: /*mockUserModel*/);

String randomString({int len = 10}) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}
