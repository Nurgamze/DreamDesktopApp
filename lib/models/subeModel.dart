class SubeModel {
  List<Sube>? data;

  SubeModel({this.data});

  SubeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Sube>[];
      json['data'].forEach((v) {
        data!.add(new Sube.fromJson(v));
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

class Sube {
  String? subeKodu;

  Sube({this.subeKodu});

  Sube.fromJson(Map<String, dynamic> json) {
    subeKodu = json['sube_kodu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sube_kodu'] = this.subeKodu;
    return data;
  }
}