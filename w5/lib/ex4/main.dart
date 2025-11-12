import 'package:flutter/material.dart';

enum Weather implements Comparable<Weather> {
  phnompenh(
    city: 'Phnom Penh',
    temperature: 12.2,
    min: 10.0,
    max: 30.0,
    image: '../assets/ex4/cloudy.png',
    colors: [ Colors.purpleAccent, Colors.purple],
  ),
  paris(
    city: 'Paris',
    temperature: 22.2,
    min: 10.0,
    max: 40.0,
    image: '../assets/ex4/sunnyCloudy.png',
    colors: [Colors.greenAccent, Colors.green],
  ),
  rome(
    city: 'Rome',
    temperature: 45.2,
    min: 10.0,
    max: 40.0,
    image: '../assets/ex4/sunny.png',
    colors: [Colors.pinkAccent, Colors.pink],
  ),
  toulouse(
    city: 'Toulouse',
    temperature: 45.2,
    min: 10.0,
    max: 40.0,
    image: '../assets/ex4/veryCloudy.png',
    colors: [Colors.orangeAccent, Colors.orange],
  );

  final String city;
  final double temperature;
  final double min;
  final double max;
  final String image;
  final List<Color> colors;

  const Weather({
    required this.city,
    required this.temperature,
    required this.min,
    required this.max,
    required this.image,
    required this.colors,
  });

  @override
  int compareTo(Weather other) => city.compareTo(other.city);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView.separated(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            itemCount: Weather.values.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final weather = Weather.values[index];
              return WeatherCard(weather: weather);
            },
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final gradColors = weather.colors;
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        weather.image, 
                        width: 36, 
                        height: 36,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          'Min: ${weather.min}°C',
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),

                        Text(
                          'Max: ${weather.max}°C',
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${weather.temperature}°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: -20,
            top: -10,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}