import 'package:http/http.dart';
import '../models/siswa.dart';

class RemoteService {
  Future<Siswa?> getData() async {
    var client = Client();
    
    var uri = Uri.parse("https://pplgrestapi.000webhostapp.com/api/siswa");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return siswaFromJson(json);
    }
  }
}