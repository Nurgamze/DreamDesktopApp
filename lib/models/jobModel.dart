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
  String? trigAdi;
  String? jobKodu;
  String? subeKodu;
  String? mailListesi;
  String? tip;
  String? yedek;
  String? yedekTarih;

  Mail(
      {this.id,
        this.trigAdi,
        this.jobKodu,
        this.subeKodu,
        this.mailListesi,
        this.tip,
        this.yedek,
        this.yedekTarih});

  Mail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trigAdi = json['trig_adi'];
    jobKodu = json['job_kodu'];
    subeKodu = json['sube_kodu'];
    mailListesi = json['mail_listesi'];
    tip = json['tip'];
    yedek = json['yedek'];
    yedekTarih = json['yedek_tarih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trig_adi'] = this.trigAdi;
    data['job_kodu'] = this.jobKodu;
    data['sube_kodu'] = this.subeKodu;
    data['mail_listesi'] = this.mailListesi;
    data['tip'] = this.tip;
    data['yedek'] = this.yedek;
    data['yedek_tarih'] = this.yedekTarih;
    return data;
  }
}