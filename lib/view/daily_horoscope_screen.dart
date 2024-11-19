import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoscope/bloc/daily_hrorscope_state.dart';
import 'package:lottie/lottie.dart';
import '../bloc/daily_horoscope_bloc.dart';

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

class DailyHoroscopeScreen extends StatelessWidget {
  const DailyHoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.gif',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF0F2027).withOpacity(0.7),
                  const Color(0xFF2C5364).withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                AppBar(
                  title: const Text(
                    'Daily Horoscope',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                ),
                Expanded(
                  child: BlocBuilder<DailyHoroscopeBloc, DailyHoroscopeState>(
                    builder: (context, state) {
                      if (state is DailyHoroscopeLoading) {
                        return  Center(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Lottie.asset('assets/loading.json')),
                        );
                      } else if (state is DailyHoroscopeLoaded) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          itemCount: state.horoscopes.length,
                          itemBuilder: (context, index) {
                            final horoscope = state.horoscopes[index];
                            final signData = zodiacSigns[index % zodiacSigns.length];

                            return Card(
                              color: Colors.white,
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: signData['image'] as Image,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            signData['sign'] as String,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            horoscope.data?.horoscopeData ??
                                                "No data available",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is DailyHoroscopeError) {
                        return Center(
                          child: Text(
                            "Error: ${state.message}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return const Center(
                        child: Text(
                          "No horoscopes available.",
                          style: TextStyle(color: Colors.white),
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
