import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoscope/bloc/daily_hrorscope_state.dart';
import 'daily_horoscope_event.dart';
import '../service/daily_horoscope_service.dart';
import '../model/daily_horoscope_model.dart';

class DailyHoroscopeBloc
    extends Bloc<DailyHoroscopeEvent, DailyHoroscopeState> {
  final DailyHoroscopeService service;

  DailyHoroscopeBloc(this.service) : super(DailyHoroscopeInitial()) {
    on<FetchAllHoroscopes>(_onFetchAllHoroscopes);
  }

  Future<void> _onFetchAllHoroscopes(
    FetchAllHoroscopes event,
    Emitter<DailyHoroscopeState> emit,
  ) async {
    emit(DailyHoroscopeLoading());
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

      List<DailyHoroscope> horoscopes = [];
      for (String sign in signs) {
        final horoscope = await service.fetchHoroscope(sign);
        if (horoscope != null) {
          horoscopes.add(horoscope);
        }
      }

      if (horoscopes.isNotEmpty) {
        emit(DailyHoroscopeLoaded(horoscopes));
      } else {
        emit(DailyHoroscopeError("Failed to load horoscopes."));
      }
    } catch (e) {
      emit(DailyHoroscopeError("An error occurred: $e"));
    }
  }
}
