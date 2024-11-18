import 'dart:convert';

import 'package:horoscope/api/api.dart';
import 'package:horoscope/model/weekly_horoscope_model.dart';
import 'package:http/http.dart' as http;

class WeeklyService {
  String _getHoroscopeUrl(String sign) {
    switch (sign.toLowerCase()) {
      case 'aries':
        return WeeklyHoroscopeApi.aries;
      case 'taurus':
        return WeeklyHoroscopeApi.taurus;
      case 'gemini':
        return WeeklyHoroscopeApi.gemini;
      case 'cancer':
        return WeeklyHoroscopeApi.cancer;
      case 'leo':
        return WeeklyHoroscopeApi.leo;
      case 'virgo':
        return WeeklyHoroscopeApi.virgo;
      case 'libra':
        return WeeklyHoroscopeApi.libra;
      case 'scorpio':
        return WeeklyHoroscopeApi.scorpio;
      case 'sagittarius':
        return WeeklyHoroscopeApi.sagittarius;
      case 'capricorn':
        return WeeklyHoroscopeApi.capricorn;
      case 'aquarius':
        return WeeklyHoroscopeApi.aquarius;
      case 'pisces':
        return WeeklyHoroscopeApi.pisces;
      default:
        throw ArgumentError('Invalid zodiac sign: $sign');
    }
  }

  Future<WeeklyHoroscope?> fetchHoroscope(String sign) async {
    try {
      final url = _getHoroscopeUrl(sign);
      final response = await http.get(Uri.parse(url));
      print("Response${response.body}");
      print("Statuscode${response.statusCode}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return WeeklyHoroscope.fromJson(json);
      } else {
        throw Exception("Failed to load horoscope for $sign");
      }
    } catch (e) {
      print("Error fetching horoscope for $sign: $e");
      return null;
    }
  }
}
