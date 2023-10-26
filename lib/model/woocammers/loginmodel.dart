class LoginResponseModel {
  bool? success;
  int? statusCode;
  String? code;
  String? massage;
  Data? data;
  LoginResponseModel({
    this.success,
    this.statusCode,
    this.code,
    this.massage,
    this.data,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    code = json['code'];
    massage = json['massage'];
    if (json['data'].toString().isNotEmpty) {
      data = Data.fromJson(json['data']);
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['code'] = code;
    data['massage'] = massage;
    if (this.data.toString().isNotEmpty) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  int? id;
  String? email;
  String? nicename;
  String? fristName;
  String? lastName;
  String? displayName;

  Data({
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.fristName,
    this.lastName,
    this.displayName,
  });
  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    nicename = json['nicename'];
    fristName = json['fristName'];
    lastName = json['lastName'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['email'] = email;
    data['nicename'] = nicename;
    data['fristName'] = fristName;
    data['lastName'] = lastName;
    data['displayName'] = displayName;

    return data;
  }
}
