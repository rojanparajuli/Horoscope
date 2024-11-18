import 'package:equatable/equatable.dart';

abstract class DailyHoroscopeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAllHoroscopes extends DailyHoroscopeEvent {}
