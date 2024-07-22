class SaveJobModel {
  bool? status;
  Data? data;

  SaveJobModel({this.status, this.data});

  SaveJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  Job? job;

  Data({this.user, this.job});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (job != null) {
      data['job'] = job!.toJson();
    }
    return data;
  }
}

class User {
  bool? like;
  String? imageJob;
  String? userName;
  String? location;
  int? userId;
  int? jobId;

  User(
      {this.like,
      this.imageJob,
      this.userName,
      this.location,
      this.userId,
      this.jobId});

  User.fromJson(Map<String, dynamic> json) {
    like = json['like'] ?? 0;
    imageJob = json['image_job'] ?? '';
    userName = json['user_name'] ?? '';
    location = json['location'] ?? '';
    userId = json['user_id'] ?? 0;
    jobId = json['job_id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['like'] = like;
    data['image_job'] = imageJob;
    data['user_name'] = userName;
    data['location'] = location;
    data['user_id'] = userId;
    data['job_id'] = jobId;
    return data;
  }
}

class Job {
  int? id;
  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  String? createdAt;
  String? updatedAt;

  Job(
      {this.id,
      this.name,
      this.image,
      this.jobTimeType,
      this.jobType,
      this.jobLevel,
      this.jobDescription,
      this.jobSkill,
      this.compName,
      this.compEmail,
      this.compWebsite,
      this.aboutComp,
      this.location,
      this.salary,
      this.favorites,
      this.expired,
      this.createdAt,
      this.updatedAt});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    jobTimeType = json['job_time_type'];
    jobType = json['job_type'];
    jobLevel = json['job_level'];
    jobDescription = json['job_description'];
    jobSkill = json['job_skill'];
    compName = json['comp_name'];
    compEmail = json['comp_email'];
    compWebsite = json['comp_website'];
    aboutComp = json['about_comp'];
    location = json['location'];
    salary = json['salary'];
    favorites = json['favorites'];
    expired = json['expired'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['job_time_type'] = jobTimeType;
    data['job_type'] = jobType;
    data['job_level'] = jobLevel;
    data['job_description'] = jobDescription;
    data['job_skill'] = jobSkill;
    data['comp_name'] = compName;
    data['comp_email'] = compEmail;
    data['comp_website'] = compWebsite;
    data['about_comp'] = aboutComp;
    data['location'] = location;
    data['salary'] = salary;
    data['favorites'] = favorites;
    data['expired'] = expired;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
