import 'package:equatable/equatable.dart';

abstract class WeeklyHoroscopeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchweeklyHoroscopes extends WeeklyHoroscopeEvent {}