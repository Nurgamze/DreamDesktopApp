class PersonelAdlariModel {
  List<Personel>? data;

  PersonelAdlariModel({this.data});

  PersonelAdlariModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Personel>[];
      json['data'].forEach((v) {
        data!.add(new Personel.fromJson(v));
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

class Personel {
  String? ntUserName;
  int? id;

  Personel({this.ntUserName});

  Personel.fromJson(Map<String, dynamic> json) {
    ntUserName = json['NtUserName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NtUserName'] = this.ntUserName;
    data['id'] = this.id;
    return data;
  }
}