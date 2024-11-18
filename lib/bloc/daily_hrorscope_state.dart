import 'package:equatable/equatable.dart';
import '../model/daily_horoscope_model.dart';

abstract class DailyHoroscopeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DailyHoroscopeInitial extends DailyHoroscopeState {}

class DailyHoroscopeLoading extends DailyHoroscopeState {}

class DailyHoroscopeLoaded extends DailyHoroscopeState {
  final List<DailyHoroscope> horoscopes;

  DailyHoroscopeLoaded(this.horoscopes);

  @override
  List<Object?> get props => [horoscopes];
}

class DailyHoroscopeError extends DailyHoroscopeState {
  final String message;

  DailyHoroscopeError(this.message);

  @override
  List<Object?> get props => [message];
}
