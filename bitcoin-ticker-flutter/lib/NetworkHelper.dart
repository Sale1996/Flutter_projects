import 'dart:convert';

import 'package:http/http.dart' as http;

const kCOIN_API_KEY = "C0D73A1A-3EF9-4625-BEEC-3E12A9883973";
const kCOIN_API_ROOT_URL = "https://rest.coinapi.io";

class NetworkHelper {
  Future<String> getBitcoinRateInCurrency(String currency) async {
    return getRateOfByCurrency("BTC", currency);
  }

  Future<String> getETHRateInCurrency(String currency) async {
    return getRateOfByCurrency("ETH", currency);
  }

  Future<String> getLTCRateInCurrency(String currency) async {
    return getRateOfByCurrency("LTC", currency);
  }

  Future<String> getRateOfByCurrency(String rateOf, currency) async {
    String url = kCOIN_API_ROOT_URL +
        "/v1/exchangerate/$rateOf/$currency?apikey=" +
        kCOIN_API_KEY;

    http.Response response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    double rate = responseBody['rate'];
    return rate.toStringAsFixed(2);
  }
}
