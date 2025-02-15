// To parse this JSON data, do
//
//     final userCredentials = userCredentialsFromJson(jsonString);

import 'dart:convert';

List<UserCredentials> userCredentialsFromJson(String str) => List<UserCredentials>.from(json.decode(str).map((x) => UserCredentials.fromJson(x)));

String userCredentialsToJson(List<UserCredentials> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCredentials {
    dynamic name;
    dynamic email;
    dynamic phone;
    int contactPersonId;

    UserCredentials({
        required this.name,
        required this.email,
        required this.phone,
        required this.contactPersonId,
    });

    factory UserCredentials.fromJson(Map<String, dynamic> json) => UserCredentials(
        name: json["name"],
        email: json["email"],
        phone: DateTime.parse(json["phone"]),
        contactPersonId: json["contact_person_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": "${phone.year.toString().padLeft(4, '0')}-${phone.month.toString().padLeft(2, '0')}-${phone.day.toString().padLeft(2, '0')}",
        "contact_person_id": contactPersonId,
    };
}
