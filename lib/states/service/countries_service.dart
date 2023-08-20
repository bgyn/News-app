import 'dart:convert';

import 'package:http/http.dart' as http;

const url =
    'https://countryapi.io/api/all?apikey=dBxpT9XypTeQ5HcA3ZMHuttGeaMCtGVQ7BQf1YAx';

Future<dynamic> getCountries() async {
  final countriesUrl = Uri.parse(url);
  final response = await http.get(countriesUrl);
  final reuslt = jsonDecode(response.body);
  return reuslt;
}
