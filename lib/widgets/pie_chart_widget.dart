import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Pie Chart',
            style: TextStyle(
              color: Colors.green,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 250,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                enabled: true,
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (event is FlTapUpEvent) {
                      if (pieTouchResponse?.touchedSection != null) {
                        // Jika section yang sama ditekan lagi, reset touchedIndex
                        if (touchedIndex ==
                            pieTouchResponse!
                                .touchedSection!
                                .touchedSectionIndex) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex =
                              pieTouchResponse
                                  .touchedSection!
                                  .touchedSectionIndex;
                        }
                      }
                    }
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: showingSections(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Indicator(color: Colors.blue, text: 'First', isSquare: true),
            SizedBox(width: 10),
            Indicator(color: Colors.yellow, text: 'Second', isSquare: true),
            SizedBox(width: 10),
            Indicator(color: Colors.purple, text: 'Third', isSquare: true),
            SizedBox(width: 10),
            Indicator(color: Colors.green, text: 'Fourth', isSquare: true),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 22.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.5,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            titlePositionPercentageOffset: 0.5,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.5,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.5,
          );
        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    this.isSquare = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
