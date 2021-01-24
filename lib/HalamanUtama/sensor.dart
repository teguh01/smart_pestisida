class Sensor{
  final double aliranAir;
  final double aliranBio;
  final String hari;
  final String jam;
  final double kecepatanAngin;
  final double kelembapan;
  final String kondisiLahan;
  final double suhu;

  Sensor({this.aliranAir, this.aliranBio, this.hari, 
          this.jam, this.kecepatanAngin, this.kelembapan, 
          this.kondisiLahan, this.suhu});

  factory Sensor.fromJson(Map<dynamic, dynamic>json){
    double parser(dynamic source){
      try{
        return double.parse(source.toString());
      }
      on FormatException{
        return -1;
      }
    }
    return Sensor(
      aliranAir: parser(json['aliran_air']),
      aliranBio: parser(json['aliran_bio']),
      hari: (json['hari']),
      jam: (json['jam']),
      kecepatanAngin: parser(json['kecepatan_angin']),
      kelembapan: parser(json['kelembapan']),
      kondisiLahan: (json['kondisi_lahan']),
      suhu: parser(json['suhu']),
    );
  }
}