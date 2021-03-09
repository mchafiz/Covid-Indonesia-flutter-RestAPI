import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:restfulapi_fluttergetx/models/covid_Indonesia.dart';
import 'package:restfulapi_fluttergetx/models/covid_provinsi.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<RxList<Covid>> fetchCovidIndonesia() async {
    final uri = Uri.parse('https://api.kawalcorona.com/indonesia');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return covidFromJson(jsonString);
    } else {
      //show error message
      throw Exception('Failed to load data');
    }
  }

  static Future<RxList<CovidProvinsi>> fetchCovidProvinsi() async {
    final uri = Uri.parse('https://api.kawalcorona.com/indonesia/provinsi');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return covidProvinsiFromJson(jsonString);
    } else {
      //show error message
      throw Exception('Failed to load data');
    }
  }
}
