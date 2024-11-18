import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoscope/bloc/weekly_horoscope_event.dart';
import 'package:horoscope/bloc/weekly_horoscope_state.dart';
import 'package:horoscope/model/weekly_horoscope_model.dart';
import 'package:horoscope/service/weekly_service.dart';

class WeeklyHoroscopeBloc
    extends Bloc<WeeklyHoroscopeEvent, WeeklyHoroscopeState> {
  final WeeklyService service;

  WeeklyHoroscopeBloc(this.service) : super(WeeklyHoroscopeInitial()) {
    on<FetchweeklyHoroscopes>(_onFetchAllHoroscopes);
  }

  Future<void> _onFetchAllHoroscopes(
    FetchweeklyHoroscopes event,
    Emitter<WeeklyHoroscopeState> emit,
  ) async {
    emit(WeeklyHoroscopeLoading());
    try {
      final signs = [
        "Aries",
        "Taurus",
        "Gemini",
        "Cancer",
        "Leo",
        "Virgo",
        "Libra",
        "Scorpio",
        "Sagittarius",
        "Capricorn",
        "Aquarius",
        "Pisces"
      ];

      List<WeeklyHoroscope> horoscopes = [];
      for (String sign in signs) {
        final horoscope = await service.fetchHoroscope(sign);
        if (horoscope != null) {
          horoscopes.add(horoscope);
        }
      }

      if (horoscopes.isNotEmpty) {
        emit(WeeklyHoroscopeLoaded(horoscopes));
      } else {
        emit(WeeklyHoroscopeError("Failed to load horoscopes."));
      }
    } catch (e) {
      emit(WeeklyHoroscopeError("An error occurred: $e"));
    }
  }
}
