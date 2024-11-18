import 'dart:convert';
import 'package:horoscope/api/api.dart';
import 'package:horoscope/model/daily_horoscope_model.dart';
import 'package:http/http.dart' as http;

class DailyHoroscopeService {
  String _getHoroscopeUrl(String sign) {
    switch (sign.toLowerCase()) {
      case 'aries':
        return DailyHoroscopeApi.aries;
      case 'taurus':
        return DailyHoroscopeApi.taurus;
      case 'gemini':
        return DailyHoroscopeApi.gemini;
      case 'cancer':
        return DailyHoroscopeApi.cancer;
      case 'leo':
        return DailyHoroscopeApi.leo;
      case 'virgo':
        return DailyHoroscopeApi.virgo;
      case 'libra':
        return DailyHoroscopeApi.libra;
      case 'scorpio':
        return DailyHoroscopeApi.scorpio;
      case 'sagittarius':
        return DailyHoroscopeApi.sagittarius;
      case 'capricorn':
        return DailyHoroscopeApi.capricorn;
      case 'aquarius':
        return DailyHoroscopeApi.aquarius;
      case 'pisces':
        return DailyHoroscopeApi.pisces;
      default:
        throw ArgumentError('Invalid zodiac sign: $sign');
    }
  }

  Future<DailyHoroscope?> fetchHoroscope(String sign) async {
    try {
      final url = _getHoroscopeUrl(sign);
      final response = await http.get(Uri.parse(url));
      print("Response${response.body}");
      print("Statuscode${response.statusCode}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return DailyHoroscope.fromJson(json);
      } else {
        throw Exception("Failed to load horoscope for $sign");
      }
    } catch (e) {
      print("Error fetching horoscope for $sign: $e");
      return null;
    }
  }
}
