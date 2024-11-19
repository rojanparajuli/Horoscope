import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weekly_horoscope_bloc.dart';
import '../bloc/weekly_horoscope_state.dart';

final zodiacSigns = [
  {
    "sign": "Aries",
    "image": Image.asset('assets/aries.png', fit: BoxFit.cover),
  },
  {
    "sign": "Taurus",
    "image": Image.asset('assets/taurus.png', fit: BoxFit.cover),
  },
  {
    "sign": "Gemini",
    "image": Image.asset('assets/gemini.png', fit: BoxFit.cover),
  },
  {
    "sign": "Cancer",
    "image": Image.asset('assets/cancer.png', fit: BoxFit.cover),
  },
  {
    "sign": "Leo",
    "image": Image.asset('assets/leo.png', fit: BoxFit.cover),
  },
  {
    "sign": "Virgo",
    "image": Image.asset('assets/virgo.png', fit: BoxFit.cover),
  },
  {
    "sign": "Libra",
    "image": Image.asset('assets/libra.png', fit: BoxFit.cover),
  },
  {
    "sign": "Scorpio",
    "image": Image.asset('assets/scorpio.png', fit: BoxFit.cover),
  },
  {
    "sign": "Sagittarius",
    "image": Image.asset('assets/sagittarius.png', fit: BoxFit.cover),
  },
  {
    "sign": "Capricorn",
    "image": Image.asset('assets/capricorn.png', fit: BoxFit.cover),
  },
  {
    "sign": "Aquarius",
    "image": Image.asset('assets/aquarius.png', fit: BoxFit.cover),
  },
  {
    "sign": "Pisces",
    "image": Image.asset('assets/pisces.png', fit: BoxFit.cover),
  },
];

class WeeklyHoroscopeScreen extends StatelessWidget {
  const WeeklyHoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image.asset(
              'assets/background.gif',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text(
                    'Weekly Horoscope',
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  elevation: 0,
                ),
                Expanded(
                  child: BlocBuilder<WeeklyHoroscopeBloc, WeeklyHoroscopeState>(
                    builder: (context, state) {
                      if (state is WeeklyHoroscopeLoading) {
                        return const Center(child: CircularProgressIndicator(color: Colors.white));
                      } else if (state is WeeklyHoroscopeLoaded) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: state.horoscopes.length,
                          itemBuilder: (context, index) {
                            final horoscope = state.horoscopes[index];
                            final signData = zodiacSigns[index % zodiacSigns.length];

                            return Card(
                              color: Colors.white,
                              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: signData['image'] as Image,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            signData['sign'] as String,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            horoscope.data?.horoscopeData ?? "No data available",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            horoscope.data?.week ?? "Unknown Date",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (state is WeeklyHoroscopeError) {
                        return Center(
                          child: Text(
                            "Error: ${state.message}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }
                      return const Center(
                        child: Text(
                          "No horoscopes available.",
                          style: TextStyle(color: Colors.black
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
