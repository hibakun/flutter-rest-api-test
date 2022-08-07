import 'dart:convert';

Siswa siswaFromJson(String str) => Siswa.fromJson(json.decode(str));

String siswaToJson(Siswa data) => json.encode(data.toJson());

class Siswa {
  Siswa({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.absen,
    required this.nama,
    required this.namaPanjang,
    required this.asal,
  });

  String id;
  String absen;
  String nama;
  String namaPanjang;
  String asal;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    absen: json["absen"],
    nama: json["nama"],
    namaPanjang: json["nama_panjang"],
    asal: json["asal"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "absen": absen,
    "nama": nama,
    "nama_panjang": namaPanjang,
    "asal": asal,
  };
}