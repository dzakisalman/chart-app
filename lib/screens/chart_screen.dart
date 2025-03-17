import 'package:flutter/material.dart';
import '../widgets/line_chart_widget.dart';
import '../widgets/bar_chart_widget.dart';
import '../widgets/pie_chart_widget.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  String _selectedChart = 'Line Chart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart App'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              value: _selectedChart,
              dropdownColor: Theme.of(context).colorScheme.surface,
              items: const [
                DropdownMenuItem(value: 'Line Chart', child: Text('Line Chart')),
                DropdownMenuItem(value: 'Bar Chart', child: Text('Bar Chart')),
                DropdownMenuItem(value: 'Pie Chart', child: Text('Pie Chart')),
              ],
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedChart = newValue;
                  });
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _buildSelectedChart(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedChart() {
    switch (_selectedChart) {
      case 'Line Chart':
        return const LineChartWidget(key: ValueKey('line'));
      case 'Bar Chart':
        return BarChartWidget(key: const ValueKey('bar'));
      case 'Pie Chart':
        return const PieChartWidget(key: ValueKey('pie'));
      default:
        return const SizedBox.shrink();
    }
  }
} 