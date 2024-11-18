import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoscope/bloc/weekly_horoscope_bloc.dart';
import 'package:horoscope/bloc/weekly_horoscope_state.dart';

const zodiacSigns = [
  {
    "sign": "Aries",
    "icon": Icons.sports_martial_arts,
    "color": Colors.redAccent
  },
  {"sign": "Taurus", "icon": Icons.grass, "color": Colors.green},
  {"sign": "Gemini", "icon": Icons.group, "color": Colors.amber},
  {
    "sign": "Cancer",
    "icon": Icons.shield,
    "color": Colors.teal
  }, 
  {"sign": "Leo", "icon": Icons.wb_sunny, "color": Colors.orangeAccent},
  {"sign": "Virgo", "icon": Icons.local_florist, "color": Colors.brown},
  {
    "sign": "Libra",
    "icon": Icons.scale,
    "color": Colors.purpleAccent
  }, 
  {"sign": "Scorpio", "icon": Icons.bug_report, "color": Colors.deepPurple},
  {
    "sign": "Sagittarius",
    "icon": Icons.sports_basketball,
    "color": Colors.blueAccent
  },
  {"sign": "Capricorn", "icon": Icons.landscape, "color": Colors.black87},
  {"sign": "Aquarius", "icon": Icons.waves, "color": Colors.blue},
  {"sign": "Pisces", "icon": Icons.pool, "color": Colors.lightBlueAccent},
];

class WeeklyHoroscopeScreen extends StatelessWidget {
  const WeeklyHoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeeklyHoroscopeBloc, WeeklyHoroscopeState>(
      builder: (context, state) {
        if (state is WeeklyHoroscopeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeeklyHoroscopeLoaded) {
          return ListView.builder(
            itemCount: state.horoscopes.length,
            itemBuilder: (context, index) {
              final horoscope = state.horoscopes[index];
              final signData = zodiacSigns[index % zodiacSigns.length];

              return Card(
                color: signData['color'] as Color,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: Icon(
                    signData['icon'] as IconData,
                    color: Colors.white,
                    size: 40,
                  ),
                  title: Text(
                    signData['sign'] as String,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    horoscope.data?.horoscopeData ?? "No data available",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        horoscope.data?.week ?? "Unknown Date",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is WeeklyHoroscopeError) {
          return Center(child: Text("Error: ${state.message}"));
        }
        return const Center(child: Text("No horoscopes available."));
      },
    );
  }
}