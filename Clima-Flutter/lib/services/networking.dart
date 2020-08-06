import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getData() async {
    http.Response httpResponse = await http.get(url);

    if (httpResponse.statusCode == 200) {
      print(httpResponse.body);
      var responseBody = httpResponse.body;
      var decodedData = jsonDecode(responseBody);
      print(decodedData);
      return decodedData;
    } else {
      print(httpResponse.statusCode);
    }
  }
}
