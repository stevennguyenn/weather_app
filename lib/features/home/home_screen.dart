import 'package:flutter/material.dart';
import 'package:weather/common/common.dart';
import 'package:weather/features/home/components/location_input.dart';
import 'package:weather/features/home/components/weather_info.dart';
import 'package:weather/network/api_provider.dart';
import 'package:weather/network/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  WeatherModel? _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather APP'),
      ),
      body: Stack(
        children: [
          const SizedBox.expand(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationInputWidget(
                locationCallback: (lat, long) {
                  getWeatherInfo(lat, long);
                },
              ),
              if (_data != null)
                Expanded(
                  child: WeatherInfoWidget(
                    data: _data!.toJson(),
                  ),
                ),
            ],
          ),
          if (_isLoading) const LoadingWidget(),
        ],
      ),
    );
  }

  Future<void> getWeatherInfo(
    double lat,
    double long,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final data = await ApiProvider.instance.weather.getWeather(
        lat: lat,
        long: long,
      );
      setState(() {
        _data = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return ErrorMessage(message: '$e');
          },
        );
      }
    }
  }
}
