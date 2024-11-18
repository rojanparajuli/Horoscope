import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoscope/bloc/daily_horoscope_bloc.dart';
import 'package:horoscope/bloc/daily_horoscope_event.dart';
import 'package:horoscope/bloc/weekly_horoscope_bloc.dart';
import 'package:horoscope/bloc/weekly_horoscope_event.dart';
import 'package:horoscope/service/daily_horoscope_service.dart';
import 'package:horoscope/service/weekly_service.dart';
import 'package:horoscope/view/daily_horoscope_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DailyHoroscopeBloc(DailyHoroscopeService())
              ..add(FetchAllHoroscopes())),
        BlocProvider(
            create: (context) => WeeklyHoroscopeBloc(WeeklyService())
              ..add(FetchweeklyHoroscopes())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DailyHoroscopeScreen(),
      ),
    );
  }
}
