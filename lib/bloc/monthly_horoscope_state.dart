import 'package:equatable/equatable.dart';
import 'package:horoscope/model/monthly_horoscope_model.dart';

abstract class MonthlyHoroscopeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MonthlyHoroscopeInitial extends MonthlyHoroscopeState {}

class MonthlyHoroscopeLoading extends MonthlyHoroscopeState {}

class MonthlyHoroscopeLoaded extends MonthlyHoroscopeState {
  final List<MonthlyHoroscope> horoscopes;

  MonthlyHoroscopeLoaded(this.horoscopes);

  @override
  List<Object?> get props => [horoscopes];
}

class MonthlyHoroscopeError extends MonthlyHoroscopeState {
  final String message;

  MonthlyHoroscopeError(this.message);

  @override
  List<Object?> get props => [message];
}
