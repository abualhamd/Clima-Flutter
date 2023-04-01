import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);
  Future<Map<String, dynamic>> getCurrentWeather() async {
    http.Response response = await http.get(Uri.parse(url));
    //var decodedData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // TODO
      throw Exception();
      // print(response.statusCode);
    }
  }
}
