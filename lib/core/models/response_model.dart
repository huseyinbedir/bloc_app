class ResponseModel {
  String? status;
  String? description;
  String? data;
  int? errorCode;

  ResponseModel({this.status, this.description, this.errorCode, this.data});

  ResponseModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'];
    errorCode = json['error_code'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = {};
    data['status'] = status;
    data['description'] = description;
    data['error_code'] = errorCode;
    data['data'] = data;
    return data;
  }
}
