import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoscope/bloc/monthly_horoscope_event.dart';
import 'package:horoscope/bloc/monthly_horoscope_state.dart';
import 'package:horoscope/model/monthly_horoscope_model.dart';
import 'package:horoscope/service/monthly_horoscope_service.dart';

class MonthlyHoroscopeBloc
    extends Bloc<MonthlyHoroscopeEvent, MonthlyHoroscopeState> {
  final MonthlyHoroscopeService service;

  MonthlyHoroscopeBloc(this.service) : super(MonthlyHoroscopeInitial()) {
    on<FetchMonthHoroscopes>(_onFetchAllHoroscopes);
  }

  Future<void> _onFetchAllHoroscopes(
    FetchMonthHoroscopes event,
    Emitter<MonthlyHoroscopeState> emit,
  ) async {
    emit(MonthlyHoroscopeLoading());
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

      List<MonthlyHoroscope> horoscopes = [];
      for (String sign in signs) {
        final horoscope = await service.fetchHoroscope(sign);
        if (horoscope != null) {
          horoscopes.add(horoscope);
        }
      }

      if (horoscopes.isNotEmpty) {
        emit(MonthlyHoroscopeLoaded(horoscopes));
      } else {
        emit(MonthlyHoroscopeError("Failed to load horoscopes."));
      }
    } catch (e) {
      emit(MonthlyHoroscopeError("An error occurred: $e"));
    }
  }
}
