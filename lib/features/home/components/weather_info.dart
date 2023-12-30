import 'package:flutter/cupertino.dart';
import '../items/items.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({
    super.key,
    required this.data,
  });

  final Map data;

  @override
  Widget build(BuildContext context) {
    final keys = data.keys.toList();
    final values = data.values.toList();
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weather information',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final value = values[index];
                debugPrint(value.toString());
                if (value is List) {
                  return ListWeatherInfo(
                    data: value as List<Map>,
                    title: keys[index],
                  );
                }
                if (value is Map) {
                  return SingleWeatherInfo(
                    data: value,
                    title: keys[index],
                  );
                }
                return const SizedBox();
              },
              itemCount: keys.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
