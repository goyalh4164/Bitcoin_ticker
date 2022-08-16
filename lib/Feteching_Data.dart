import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'FD773CE6-0B3C-4D02-ABDD-5FDE9A63AA39';
const base_address = 'https://rest.coinapi.io/v1/exchangerate';

// https://rest.coinapi.io/v1/exchangerate/BTC/CND?apikey=FD773CE6-0B3C-4D02-ABDD-5FDE9A63AA39
class CoinPrice {
  CoinPrice({required this.currency_name}) {}
  final String currency_name;

  Future<List<int>> getData() async {
    List<int> current_value = [];
    var url1 = '$base_address/BTC/$currency_name?apikey=$apiKey';
    var url2 = '$base_address/ETH/$currency_name?apikey=$apiKey';
    var url3 = '$base_address/LTC/$currency_name?apikey=$apiKey';
    http.Response response1 = await http.get(Uri.parse(url1));
    http.Response response2 = await http.get(Uri.parse(url2));
    http.Response response3 = await http.get(Uri.parse(url3));
    if (response1.statusCode == 200) {
      String data = response1.body;
      var decodedData = jsonDecode(data);
      double price = decodedData['rate'];
      current_value.add(price.toInt());
    } else {
      print(response1.statusCode);
    }
    if (response2.statusCode == 200) {
      String data = response2.body;
      var decodedData = jsonDecode(data);
      double price = decodedData['rate'];
      current_value.add(price.toInt());
    } else {
      print(response2.statusCode);
    }
    if (response3.statusCode == 200) {
      String data = response3.body;
      var decodedData = jsonDecode(data);
      double price = decodedData['rate'];
      current_value.add(price.toInt());
    } else {
      print(response3.statusCode);
    }
    return current_value;
  }
}
