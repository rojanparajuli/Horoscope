
import 'package:equatable/equatable.dart';
import 'package:horoscope/model/weekly_horoscope_model.dart';

abstract class WeeklyHoroscopeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeeklyHoroscopeInitial extends WeeklyHoroscopeState {}

class WeeklyHoroscopeLoading extends WeeklyHoroscopeState {}

class WeeklyHoroscopeLoaded extends WeeklyHoroscopeState {
  final List<WeeklyHoroscope> horoscopes;

  WeeklyHoroscopeLoaded(this.horoscopes);

  @override
  List<Object?> get props => [horoscopes];
}

class WeeklyHoroscopeError extends WeeklyHoroscopeState {
  final String message;

  WeeklyHoroscopeError(this.message);

  @override
  List<Object?> get props => [message];
}
