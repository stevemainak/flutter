import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:systemapp/environments.dart';
import 'package:systemapp/models/user_model.dart';

final   apiServicesProvider = Provider((_) {
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

  Future<List<dynamic>> userdetails(email) async {
    Map<String, dynamic> ;
    var res = await http.get(
      Uri.parse("${Environment.hrURL}/user/personal_details/?personalemail=$email"),
      
    );

    var list = [res.body, res.statusCode];
    print(list);
    return list;
  }

  Future<List<dynamic>> myprofile(staff_id) async {
    Map<String, dynamic> ;
    var res = await http.get(
      Uri.parse("${Environment.hrURL}/user/my_profile/?staff_id=$staff_id"),
      
    );

    var list = [res.body, res.statusCode];
    
    return list;
  }

  // Future<List<UserInfo>> fetchUserProfile(String token) async {
  //   final response = await http.get(
  //      Uri.parse("${Environment.hrURL}/user/my_profile/"),
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body) as Map<String, dynamic>;
  //     return [
  //       UserInfo.fromJson(data['personalInfo'], "Personal Info"),
  //       UserInfo.fromJson(data['statutoryDeclaration'], "Statutory Declaration"),
  //       UserInfo.fromJson(data['nextOfKin'], "Next of Kin"),
  //       UserInfo.fromJson(data['familyDetails'], "Family Details"),
  //     ];
  //   } else {
  //     throw Exception('Failed to load user profile');
  //   }
  // }

  // Future<List<dynamic>> getUserClaims(
//   officerId,
  //   accessToken,
  // ) async {
  //   var res = await http.get(
  //     Uri.parse(
  //         "${Environment.serverIp}/officers_management/claims_summary?officer_id=$officerId"),
  //     headers: {"Authorization": "JWT $accessToken"},
  //   );
  //   var list = [res.body, res.statusCode];

  //   return list;
  //   //return null;
  // }
}