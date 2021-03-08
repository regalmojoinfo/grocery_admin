import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  String accountStatus;
  bool activated;
  String uid;
  String name;
  String email;
  String mobileNo;
  String tokenId;
  String password;
  bool primaryAdmin;
  String profileImageUrl;
  Timestamp timestamp;

  Admin({
    this.accountStatus,
    this.activated,
    this.email,
    this.mobileNo,
    this.name,
    this.tokenId,
    this.uid,
    this.primaryAdmin,
    this.profileImageUrl,
    this.password,
    this.timestamp,
  });

  Admin.fromJson(Map<String, dynamic> json) {
    accountStatus = json['accountStatus'];
    activated = json['activates'];

    uid = json['uid'];
    name = json['username'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    email = json['email'];
  }
  factory Admin.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Admin(
      accountStatus: data['accountStatus'],
      activated: data['activated'],
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      mobileNo: data['mobileNo'],
      tokenId: data['tokenId'],
      primaryAdmin: data['primaryAdmin'],
      profileImageUrl: data['profileImageUrl'],
      password: data['password'],
      timestamp: data['timestamp'],
    );
  }
}

//define function for api using

//  Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uid'] = this.uid;

//     data['accountStatus'] = this.accountStatus;
//     data['activated'] = this.activated;

//     data['uid'] = this.uid;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['mobileNo'] = this.mobileNo;
//     data['tokenId'] = this.tokenId;
//     data['primaryAdmin'] = this.primaryAdmin;
//     data['profileImageUrl'] = this.profileImageUrl;

//     data['password'] = this.password;
//     data['timestamp'] = this.timestamp;
//   }
