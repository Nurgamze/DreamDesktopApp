class MailModel {
  List<Mail>? data;

  MailModel({this.data});

  MailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Mail>[];
      json['data'].forEach((v) {
        data!.add(new Mail.fromJson(v));
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

class Mail {
  int? id;
  String? trig_adi;
  String? mailListesi;
  String? yedek;

  Mail({this.id,this.mailListesi, this.yedek ,this.trig_adi});

  Mail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trig_adi = json['trig_adi'];
    mailListesi = json['mail_listesi'];
    yedek = json['yedek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trig_adi'] = this.trig_adi;
    data['mail_listesi'] = this.mailListesi;
    data['yedek'] = this.yedek;
    return data;
  }
}