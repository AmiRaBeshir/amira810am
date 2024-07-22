class GetPortofoliosModel {
  bool? status;
  Data? data;

  GetPortofoliosModel({this.status, this.data});

  GetPortofoliosModel.fromJson(Map<String, dynamic> json) {
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
  List<Portfolio>? portfolio;
  Profile? profile;

  Data({this.portfolio, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['portfolio'] != null) {
      portfolio = <Portfolio>[];
      json['portfolio'].forEach((v) {
        portfolio!.add(Portfolio.fromJson(v));
      });
    }
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (portfolio != null) {
      data['portfolio'] = portfolio!.map((v) => v.toJson()).toList();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Portfolio {
  int? id;
  String? cvFile;
  String? name;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Portfolio(
      {this.id,
        this.cvFile,
        this.name,
        this.image,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Portfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cvFile = json['cv_file'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cv_file'] = cvFile;
    data['name'] = name;
    data['image'] = image;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Profile {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? language;
  String? interestedWork;
  String? offlinePlace;
  String? remotePlace;
  String? bio;
  String? education;
  String? experience;
  String? personalDetailed;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.userId,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.language,
        this.interestedWork,
        this.offlinePlace,
        this.remotePlace,
        this.bio,
        this.education,
        this.experience,
        this.personalDetailed,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    language = json['language'];
    interestedWork = json['interested_work'];
    offlinePlace = json['offline_place'];
    remotePlace = json['remote_place'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    personalDetailed = json['personal_detailed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['language'] = language;
    data['interested_work'] = interestedWork;
    data['offline_place'] = offlinePlace;
    data['remote_place'] = remotePlace;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['personal_detailed'] = personalDetailed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}