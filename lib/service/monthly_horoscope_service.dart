import 'dart:convert';

import 'package:horoscope/api/api.dart';
import 'package:horoscope/model/monthly_horoscope_model.dart';
import 'package:http/http.dart' as http;

class MonthlyHoroscopeService {
  String _getHoroscopeUrl(String sign) {
    switch (sign.toLowerCase()) {
      case 'aries':
        return MonthlyHoroscopeApi.aries;
      case 'taurus':
        return MonthlyHoroscopeApi.taurus;
      case 'gemini':
        return MonthlyHoroscopeApi.gemini;
      case 'cancer':
        return MonthlyHoroscopeApi.cancer;
      case 'leo':
        return MonthlyHoroscopeApi.leo;
      case 'virgo':
        return MonthlyHoroscopeApi.virgo;
      case 'libra':
        return MonthlyHoroscopeApi.libra;
      case 'scorpio':
        return MonthlyHoroscopeApi.scorpio;
      case 'sagittarius':
        return MonthlyHoroscopeApi.sagittarius;
      case 'capricorn':
        return MonthlyHoroscopeApi.capricorn;
      case 'aquarius':
        return MonthlyHoroscopeApi.aquarius;
      case 'pisces':
        return MonthlyHoroscopeApi.pisces;
      default:
        throw ArgumentError('Invalid zodiac sign: $sign');
    }
  }

  Future<MonthlyHoroscope?> fetchHoroscope(String sign) async {
    try {
      final url = _getHoroscopeUrl(sign);
      final response = await http.get(Uri.parse(url));
      print("Response${response.body}");
      print("Statuscode${response.statusCode}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return MonthlyHoroscope.fromJson(json);
      } else {
        throw Exception("Failed to load horoscope for $sign");
      }
    } catch (e) {
      print("Error fetching horoscope for $sign: $e");
      return null;
    }
  }
}
