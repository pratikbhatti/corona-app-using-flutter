import 'dart:convert';

import 'package:demo38/screens/home/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<HomeModal?> getData() async {
    String? link =
        "https://corona-virus-world-and-india-data.p.rapidapi.com/api";

    var response = await http.get(
      Uri.parse(link),
      headers: {
        "X-RapidAPI-Key": "c166082712mshb7213b2ae9b62ddp1eb544jsn26839b0f4ec8",
        "X-RapidAPI-Host": "corona-virus-world-and-india-data.p.rapidapi.com",
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return HomeModal.fromJson(json);
    } else {
      return null;
    }
  }
}
