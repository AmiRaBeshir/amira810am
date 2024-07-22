class AppliedJobModel {
  bool? status;
  List<Data>? data;

  AppliedJobModel({this.status, this.data});

  AppliedJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? workType;
  String? cvFile;
  String? otherFile;
  int? jobsId;
  int? userId;
  int? reviewed;
  Null accept;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.workType,
        this.cvFile,
        this.otherFile,
        this.jobsId,
        this.userId,
        this.reviewed,
        this.accept,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??'';
    email = json['email']??'';
    mobile = json['mobile']??'';
    workType = json['work_type']??'';
    cvFile = json['cv_file']??'';
    otherFile = json['other_file']??'';
    jobsId = json['jobs_id']??0;
    userId = json['user_id']??0;
    reviewed = json['reviewed']??0 ;
    accept = json['accept'];
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['work_type'] = workType;
    data['cv_file'] = cvFile;
    data['other_file'] = otherFile;
    data['jobs_id'] = jobsId;
    data['user_id'] = userId;
    data['reviewed'] = reviewed;
    data['accept'] = accept;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}