// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:systemapp/domain/authentication/login/login.dart';

// class SessionManager {
//   static const String _tokenKey = 'authToken';
//   static final FlutterSecureStorage _storage = FlutterSecureStorage();

//   // Save token to secure storage
//   static Future<void> saveToken(String token) async {
//     await _storage.write(key: _tokenKey, value: token);
//   }

//   // Retrieve token from secure storage
//   static Future<String?> getToken() async {
//     return await _storage.read(key: _tokenKey);
//   }

//   // Clear token from secure storage to log out
//   static Future<void> clearToken() async {
//     await _storage.delete(key: _tokenKey);
//   }

//   // Check if user is logged in
//   static Future<bool> isLoggedIn() async {
//     String? token = await _storage.read(key: _tokenKey);
//     return token != null;
//   }

//   // Logout function to clear token and navigate to LoginPage
//   static Future<void> logout(BuildContext context) async {
//     await clearToken();
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => const Loginpage()),
//       (route) => false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:systemapp/domain/authentication/login/login.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyUserid = 'id';
  static const _keyUserRoleId = 'roleId';
  static const _keyStaffid = 'staff_id';
  static const _keyUsername = 'name';
  static const _keyUserEmail = 'email';
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyUserRole = 'role';
  static const _keyPhone = 'phone';
  static const _keyDOB = 'dob';
  static const _keyGender = 'gender';
  static const _keyMaritalStatus = 'marital_status';
  static const _keyResidence = 'place_of_residence';
  static const _keyProfilePhoto = 'profile_photo';



  static Future setUserid(String id) async {
    await _storage.write(key: _keyUserid, value: id);
  }

  static Future getUserid() async {
    return await _storage.read(key: _keyUserid);
  }

   static Future setUserName(String name) async {
    await _storage.write(key: _keyUsername, value: name);
  }

  static Future getUserName() async {
    return await _storage.read(key: _keyUsername);
  }

  static Future setUserRoleId(String roleId) async {
    await _storage.write(key: _keyUserRoleId, value: roleId);
  }

  static Future getUserRoleId() async {
    return await _storage.read(key: _keyUserRoleId);
  }

   static Future setstaffid(String staffId) async {
    await _storage.write(key: _keyStaffid, value: staffId);
  }

  static Future getstaffid() async {
    return await _storage.read(key: _keyStaffid);
  }


  static Future setUserEmail(String email) async {
    await _storage.write(key: _keyUserEmail, value: email);
  }

  static Future getUserEmail() async {
    return await _storage.read(key: _keyUserEmail);
  }



 

  static Future setPhoneNumber(String phone) async {
    return await _storage.write(key: _keyPhone, value: phone);
  }

  static Future getPhoneNumber() async {
    return await _storage.read(key: _keyPhone);
  }

  static Future setAccessToken(String accessToken) async {
    return await _storage.write(key: _keyAccessToken, value: accessToken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  static Future<void> clearAccessToken() async {
    await _storage.delete(key: _keyAccessToken);
  }

  static Future setRefreshToken(String refreshToken) async {
    return await _storage.write(key: _keyRefreshToken, value: refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  static Future setUserRole(String role) async {
    return await _storage.write(key: _keyUserRole, value: role);
  }

  static Future getUserRole() async {
    return await _storage.read(key: _keyUserRole);
  }

  static Future setDOB(String dob) async {
    await _storage.write(key: _keyDOB, value: dob);
  }

  static Future getDOB() async {
    return await _storage.read(key: _keyDOB);
  }

  static Future setGender(String gender) async {
    await _storage.write(key: _keyGender, value: gender);
  }

  static Future getGender() async {
    return await _storage.read(key: _keyGender);
  }

  static Future setMaritalStatus(String status) async {
    await _storage.write(key: _keyMaritalStatus, value: status);
  }

  static Future getMaritalStatus() async {
    return await _storage.read(key: _keyMaritalStatus);
  }

  static Future setResidence(String residence) async {
    await _storage.write(key: _keyResidence, value: residence);
  }

  static Future getResidence() async {
    return await _storage.read(key: _keyResidence);
  }

  static Future setProfilePhoto(String photoUrl) async {
    await _storage.write(key: _keyProfilePhoto, value: photoUrl);
  }

  static Future getProfilePhoto() async {
    return await _storage.read(key: _keyProfilePhoto);
  }

 

  static Future<void> clearAll() async {
  await _storage.deleteAll();
} 


    // static const String _tokenKey = 'authToken';
  

  // Save token to secure storage
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  // Retrieve token from secure storage
  static Future<String?> getToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  // Clear token from secure storage to log out
  static Future<void> clearToken() async {
    await _storage.delete(key: _keyAccessToken);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    String? token = await _storage.read(key: _keyAccessToken);
    return token != null;
  }

  // Logout function to clear token and navigate to LoginPage
 static Future<void> logout(BuildContext context) async {
  await clearAll();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const Loginpage()),
    (route) => false,
  );
}

  


 

  // static Future setInvoiceId(int id)async {
  //   return await _storage.write(key: _keyInvoiceId, value: id.toString());
  // }
  // static Future getInvoiceId()async {
  //   return await _storage.read(key: _keyInvoiceId);
  // }
}
