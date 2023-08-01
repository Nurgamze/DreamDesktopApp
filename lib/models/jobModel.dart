class JobModel {
  List<Data>? data;

  JobModel({this.data});

  JobModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? jobKodu;

  Data({this.jobKodu});

  Data.fromJson(Map<String, dynamic> json) {
    jobKodu = json['job_kodu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_kodu'] = this.jobKodu;
    return data;
  }
}