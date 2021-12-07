class SampleModel {
  String? description;
  int? timer;
  String? profileImage;

  SampleModel({this.description, this.timer, this.profileImage});

  SampleModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    timer = json['timer'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['timer'] = timer;
    data['profileImage'] = profileImage;
    return data;
  }
}
