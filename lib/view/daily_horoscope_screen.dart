import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/daily_horoscope_bloc.dart';
import '../bloc/daily_hrorscope_state.dart';

final zodiacSigns = [
  {
    "sign": "Aries",
    "image": Image.asset('assets/aries.png'),
  },
  {
    "sign": "Taurus",
    "image": Image.asset('assets/taurus.png'),
  },
  {
    "sign": "Gemini",
    "image": Image.asset('assets/gemini.png'),
  },
  {
    "sign": "Cancer",
    "image": Image.asset('assets/cancer.png'),
  },
  {
    "sign": "Leo",
    "image": Image.asset('assets/leo.png'),
  },
  {
    "sign": "Virgo",
    "image": Image.asset('assets/virgo.png'),
  },
  {
    "sign": "Libra",
    "image": Image.asset('assets/libra.png'),
  },
  {
    "sign": "Scorpio",
    "image": Image.asset('assets/scorpio.png'),
  },
  {
    "sign": "Sagittarius",
    "image": Image.asset('assets/sagittarius.png'),
  },
  {
    "sign": "Capricorn",
    "image": Image.asset('assets/capricorn.png'),
  },
  {
    "sign": "Aquarius",
    "image": Image.asset('assets/aquarius.png'),
  },
  {
    "sign": "Pisces",
    "image": Image.asset('assets/pisces.png'),
  },
];

class DailyHoroscopeScreen extends StatelessWidget {
  const DailyHoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Horoscope',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: BlocBuilder<DailyHoroscopeBloc, DailyHoroscopeState>(
        builder: (context, state) {
          if (state is DailyHoroscopeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DailyHoroscopeLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: state.horoscopes.length,
              itemBuilder: (context, index) {
                final horoscope = state.horoscopes[index];
                final signData = zodiacSigns[index % zodiacSigns.length];

                return Card(
                  color: Colors.black,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Colors.blue,
                      height: 100,
                      width: 100,
                      child: signData['image'] as Image,
                    ),
                  
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              horoscope.data!.horoscopeData!.length > 300
                                  ? '${horoscope.data?.horoscopeData?.substring(0, 300)}...'
                                  : horoscope.data?.horoscopeData ??
                                      "No data available",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  
                        ],
                      )
                    ],
                  )
                  
                  
                  // ExpansionTile(
                  //   collapsedIconColor: Colors.red,
                  //   tilePadding: const EdgeInsets.all(12),
                  //   leading: SizedBox(
                  //     height: 100,
                  //     width: 100,
                  //     child: signData['image'] as Image,
                  //   ),
                  //   title: Text(
                  //     signData['sign'] as String,
                  //     style: const TextStyle(
                  //       fontSize: 22,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   subtitle: Text(
                  //     horoscope.data!.horoscopeData!.length > 100
                  //         ? '${horoscope.data?.horoscopeData?.substring(0, 100)}...'
                  //         : horoscope.data?.horoscopeData ??
                  //             "No data available",
                  //     style: const TextStyle(
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   iconColor: Colors
                  //       .white, 
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 16),
                  //       child: Text(
                  //         horoscope.data?.horoscopeData ?? "No data available",
                  //         style: const TextStyle(
                  //           fontSize: 16,
                  //           color: Colors.white70,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                );
              },
            );
          } else if (state is DailyHoroscopeError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const Center(child: Text("No horoscopes available."));
        },
      ),
    );
  }
}
