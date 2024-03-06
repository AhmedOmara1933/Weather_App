import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlChart extends StatelessWidget {
  const FlChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(bottom: 20.0),
      child: LineChart(LineChartData(
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: false,
        ),
        borderData: FlBorderData(show: false, border: Border.all(width: 0.0)),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 7,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 3.1),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            color: Color(0xff4bc8f0),
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: true, color: Color(0xffd1f2fc)),
          ),
        ],
      )),
    );
  }
}
