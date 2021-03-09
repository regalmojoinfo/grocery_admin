class User {
  String message;
  Data data;

  User({this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  UserData userData;
  String token;

  Data({this.userData, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class UserData {
  String staffType;
  int status;
  String sId;
  String staffName;
  int staffContact;
  String staffPassword;
  String createdAt;
  String updatedAt;
  int iV;

  UserData(
      {this.staffType,
      this.status,
      this.sId,
      this.staffName,
      this.staffContact,
      this.staffPassword,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserData.fromJson(Map<String, dynamic> json) {
    staffType = json['staffType'];
    status = json['status'];
    sId = json['_id'];
    staffName = json['staffName'];
    staffContact = json['staffContact'];
    staffPassword = json['staffPassword'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staffType'] = this.staffType;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['staffName'] = this.staffName;
    data['staffContact'] = this.staffContact;
    data['staffPassword'] = this.staffPassword;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
