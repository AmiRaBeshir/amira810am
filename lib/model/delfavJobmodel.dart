class DelFavJobModel {
  bool? status;
  String? message;

  DelFavJobModel({this.status, this.message});

  DelFavJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
