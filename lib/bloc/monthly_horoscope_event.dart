import 'package:equatable/equatable.dart';

abstract class MonthlyHoroscopeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMonthHoroscopes extends MonthlyHoroscopeEvent {}