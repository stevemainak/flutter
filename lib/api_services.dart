import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:systemapp/environments.dart';

final apiServicesProvider = Provider((_) {
  return ApiServices();
});

class ApiServices {
  Future<List<dynamic>> loginUser(email, password) async {
    Map<String, dynamic> body = {"email": email, "password": password};
    var res = await http.post(
      Uri.parse("${Environment.hrURL}/user/login/"),
      body: body,
    );

    var list = [res.body, res.statusCode];
    print(list);
    return list;
  }
}