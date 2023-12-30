import 'package:flutter/material.dart';
import 'package:weather/features/home/items/info_item.dart';

class SingleWeatherInfo extends StatelessWidget {
  const SingleWeatherInfo({
    super.key,
    required this.data,
    required this.title,
  });

  final Map data;
  final String title;

  @override
  Widget build(BuildContext context) {
    final keys = data.keys.toList();
    final values = data.values.toList();
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
        const SizedBox(
          height: 12,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return InfoItem(
              title: '${keys[index]}: ',
              message: '${values[index] ?? '-'}',
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: data.keys.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
