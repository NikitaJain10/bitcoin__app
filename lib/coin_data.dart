import 'dart:convert';

import 'package:http/http.dart' as http;


const apikey = 'A533E1A6-D587-4013-90EE-23F210E3F99D';

const apiurl = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getExchangeRate(String currency2) async {
    Map<String, String> criptoPrices = {};
    for (String currency1 in cryptoList) {
      http.Response response =
      await http.get('$apiurl/$currency1/$currency2?apikey=$apikey');
      if (response.statusCode == 200) {
        var decodedBody = jsonDecode(response.body);
        double rate = decodedBody['rate'];
        criptoPrices[currency1] = rate.toStringAsFixed(3);
      } else {
        print('failed ${response.statusCode}');
        return;
      }
    }
    return criptoPrices;
  }
}

/*import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'A533E1A6-D587-4013-90EE-23F210E3F99D';
const apiUrl = 'https://rest.coinapi.io/v1/exchangerate/';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getExchangeRate(String currency2) async {
    Map<String, String> cryptoPrices = {};
    for (String currency1 in cryptoList) {
      http.Response response =
          await http.get('$apiUrl/$currency1/$currency2?apiKey=$apiKey');
      if (response.statusCode == 200) {
        var decodedBody = jsonDecode(response.body);
        double rate = decodedBody['rate'];
        cryptoPrices[currency1] = rate.toStringAsFixed(3);
      } else {
        print('failed ${response.statusCode}');
        return;
      }
    }
    return cryptoPrices;
  }
}*/
