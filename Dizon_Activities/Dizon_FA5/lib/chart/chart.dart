import 'package:flutter/material.dart';
import 'package:expense_app/chart/chart_bar.dart';

class CheckoutChart extends StatelessWidget {
  final Map<String, int> categoryCounts;

  const CheckoutChart({super.key, required this.categoryCounts});

  double get maxValue {
    double maxVal = 0;
    for (final v in categoryCounts.values) {
      if (v > maxVal) maxVal = v.toDouble();
    }
    return maxVal == 0 ? 1 : maxVal;
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final categories = ['Food', 'Drinks', 'Sides'];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
                Color.fromARGB(255, 255, 110, 151), 
                Color.fromARGB(255, 253, 155, 183),
                Color.fromARGB(255, 254, 217, 227), 
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: categories.map((cat) {
                final val = categoryCounts[cat] ?? 0;
                final fill = val == 0 ? 0 : val / maxValue;
                return Expanded(
                  child: ChartBar(fill: fill.toDouble()),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: categories.map((cat) {
              IconData icon;
              switch (cat) {
                case 'Food':
                  icon = Icons.fastfood;
                  break;
                case 'Drinks':
                  icon = Icons.local_drink;
                  break;
                default:
                  icon = Icons.ramen_dining;
              }
              return Icon(
                icon,
                color: const Color.fromARGB(255, 104, 8, 36),
                        
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
