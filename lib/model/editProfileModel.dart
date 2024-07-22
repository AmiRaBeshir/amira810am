class EditPortofolioModel {
  bool? status;
  Data? data;

  EditPortofolioModel({this.status, this.data});

  EditPortofolioModel.fromJson(Map<String, dynamic> json) {
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
  String? bio;
  String? address;
  String? mobile;
  String? language;
  String? interestedWork;
  String? offlinePlace;
  String? remotePlace;
  String? experience;
  String? personalDetailed;
  String? education;

  Data(
      {this.bio,
        this.address,
        this.mobile,
        this.language,
        this.interestedWork,
        this.offlinePlace,
        this.remotePlace,
        this.experience,
        this.personalDetailed,
        this.education});

  Data.fromJson(Map<String, dynamic> json) {
    bio = json['bio']??'';
    address = json['address']??'';
    mobile = json['mobile']??'';
    language = json['language']??'';
    interestedWork = json['interested_work']??'';
    offlinePlace = json['offline_place']??'';
    remotePlace = json['remote_place']??'';
    experience = json['experience']??'';
    personalDetailed = json['personal_detailed']??'';
    education = json['education']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bio'] = bio;
    data['address'] = address;
    data['mobile'] = mobile;
    data['language'] = language;
    data['interested_work'] = interestedWork;
    data['offline_place'] = offlinePlace;
    data['remote_place'] = remotePlace;
    data['experience'] = experience;
    data['personal_detailed'] = personalDetailed;
    data['education'] = education;
    return data;
  }
}