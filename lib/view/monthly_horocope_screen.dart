import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/monthly_horoscope_bloc.dart';
import '../bloc/monthly_horoscope_state.dart';

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

class MonthlyHoroscopeScreen extends StatelessWidget {
  const MonthlyHoroscopeScreen({super.key});

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
          // Content with a semi-transparent overlay for better readability
          Container(
            color: Colors.black.withOpacity(0.6),
            child: BlocBuilder<MonthlyHoroscopeBloc, MonthlyHoroscopeState>(
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: 100,
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text(
                          'Monthly Horoscope',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        centerTitle: true,
                      ),
                    ),
                    if (state is MonthlyHoroscopeLoading) ...[
                      const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ] else if (state is MonthlyHoroscopeLoaded) ...[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final horoscope = state.horoscopes[index];
                            final signData =
                                zodiacSigns[index % zodiacSigns.length];

                            return Card(
                              color: Colors.white,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        child: signData['image'] as Image,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
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
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            horoscope.data?.month ??
                                                "Unknown Date",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
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
                          childCount: state.horoscopes.length,
                        ),
                      ),
                    ] else if (state is MonthlyHoroscopeError) ...[
                      SliverFillRemaining(
                        child: Center(
                          child: Text(
                            "Error: ${state.message}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ] else ...[
                      const SliverFillRemaining(
                        child: Center(
                          child: Text(
                            "No horoscopes available.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
