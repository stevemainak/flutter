// To parse this JSON data, do
//
//     final loginCredentials = loginCredentialsFromJson(jsonString);

import 'dart:convert';

LoginCredentials loginCredentialsFromJson(String str) => LoginCredentials.fromJson(json.decode(str));

String loginCredentialsToJson(LoginCredentials data) => json.encode(data.toJson());

class LoginCredentials {
    int id;
    String roleId;
    String email;
    Tokens tokens;
    String role;
    bool isActive;
    PersonalInfo personalInfo;

    LoginCredentials({
        required this.id,
        required this.roleId,
        required this.email,
        required this.tokens,
        required this.role,
        required this.isActive,
        required this.personalInfo,
    });

    factory LoginCredentials.fromJson(Map<String, dynamic> json) => LoginCredentials(
        id: json["id"],
        roleId: json["role_id"],
        email: json["email"],
        tokens: Tokens.fromJson(json["tokens"]),
        role: json["role"],
        isActive: json["is_active"],
        personalInfo: PersonalInfo.fromJson(json["personal_info"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "email": email,
        "tokens": tokens.toJson(),
        "role": role,
        "is_active": isActive,
        "personal_info": personalInfo.toJson(),
    };
}

class PersonalInfo {
    int staffPersonalId;
    String staffId;
    String companyId;
    String fullName;
    DateTime dob;
    String gender;
    String email;
    String phoneNumber;
    String maritialStatus;
    String placeOfResidence;
    String profilePhoto;

    PersonalInfo({
        required this.staffPersonalId,
        required this.staffId,
        required this.companyId,
        required this.fullName,
        required this.dob,
        required this.gender,
        required this.email,
        required this.phoneNumber,
        required this.maritialStatus,
        required this.placeOfResidence,
        required this.profilePhoto,
    });

    factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        staffPersonalId: json["staff_personal_id"],
        staffId: json["staff_id"],
        companyId: json["company_id"],
        fullName: json["full_name"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        maritialStatus: json["maritial_status"],
        placeOfResidence: json["place_of_residence"],
        profilePhoto: json["profile_photo"],
    );

    Map<String, dynamic> toJson() => {
        "staff_personal_id": staffPersonalId,
        "staff_id": staffId,
        "company_id": companyId,
        "full_name": fullName,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "email": email,
        "phone_number": phoneNumber,
        "maritial_status": maritialStatus,
        "place_of_residence": placeOfResidence,
        "profile_photo": profilePhoto,
    };
}

class Tokens {
    String refresh;
    String access;

    Tokens({
        required this.refresh,
        required this.access,
    });

    factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
    };
}
