import 'package:http/http.dart';
import '../models/siswa.dart';

class RemoteService {
  static const String url = "https://pplgrestapi.000webhostapp.com/api/siswa";

  Future<Siswa?> getData() async {
    var client = Client();
    
    var uri = Uri.parse(url);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return siswaFromJson(json);
    } else {
      throw Exception("Failed to fetch data from API");
    }
  }
}