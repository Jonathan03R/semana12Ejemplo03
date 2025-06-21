import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<_PieData> pieData = <_PieData>[
      _PieData('John', 35, 'John'),
      _PieData('Jane', 28, 'Jane'),
      _PieData('Alex', 34, 'Alex'),
      _PieData('Emma', 32, 'Emma'),
      _PieData('Mike', 40, 'Mike'),
    ];

    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52),
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Roque Jonathan - Charts ')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            padding: const EdgeInsets.all(18.0),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SfCartesianChart(
                    title: ChartTitle(text: 'Progreso 01'),
                    legend: Legend(isVisible: true),
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),

                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                        // Bind data source
                        dataSource: <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),

                  SfCircularChart(
                    title: ChartTitle(text: 'Grafico Circular'),
                    legend: Legend(
                      isVisible: true,
                      position: LegendPosition.left,
                    ),
                    series: <PieSeries<_PieData, String>>[
                      PieSeries<_PieData, String>(
                        explode: true,
                        explodeIndex: 0,
                        dataSource: pieData,
                        xValueMapper: (_PieData data, _) => data.xData,
                        yValueMapper: (_PieData data, _) => data.yData,
                        dataLabelMapper: (_PieData data, _) => data.text,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),

                  SfCartesianChart(
                    title: ChartTitle(text: 'Progreso 01'),
                    legend: Legend(isVisible: true),
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),

                    series: <ColumnSeries<SalesData, String>>[
                      ColumnSeries<SalesData, String>(
                        // Bind data source
                        dataSource: <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),

                  SfCartesianChart(
                    title: ChartTitle(text: 'Progreso 01'),
                    legend: Legend(isVisible: true),
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),

                    series: <BubbleSeries<SalesData, String>>[
                      BubbleSeries<SalesData, String>(
                        // Bind data source
                        dataSource: <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),

                  SfPyramidChart(
                    legend: Legend(isVisible: true),
                    title: ChartTitle(text: 'Piramide Chart Example'),
                    series: PyramidSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  String? text;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
