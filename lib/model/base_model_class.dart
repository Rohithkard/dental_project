class BaseClassModel {
  bool? success;
  String? message;
  String? instance;
  var data;

  BaseClassModel({this.success, this.message, this.instance});

  BaseClassModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    instance = json['instance'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['instance'] = instance;
    data['data'] = this.data;
    return data;
  }
}
