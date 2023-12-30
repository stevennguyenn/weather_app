import 'package:flutter/material.dart';
import 'package:weather/features/home/items/items.dart';

class ListWeatherInfo extends StatelessWidget {
  const ListWeatherInfo({
    super.key,
    required this.data,
    required this.title,
  });

  final List<Map> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.deepPurple,
            ),
          ),
        ListView.separated(
          itemBuilder: (context, index) {
            return SingleWeatherInfo(
              data: data[index],
              title: '',
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
