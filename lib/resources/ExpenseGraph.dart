import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';


 class GraphWidget extends StatelessWidget {
  final List<double> data;

 GraphWidget({Key key, this.data}) : super(key: key);

  _onSelection(SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    var time;
    final measures = <String, double>{};

    // We get the model that updated with a list of [SeriesDatum] which is
    // simply a pair of series & datum.
    //
    // Walk the selection updating the measures map, storing off the sales and
    // series name for each selection point.
    if (selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum;
      selectedDatum.forEach((SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum;
      });
    }

    print(time);
    print(measures);

    // Request a build.
    //setState(() {
    //_time = time;
    //_measures = measures;
    //});
  }

  @override
  Widget build(BuildContext context) {
    List<Series<double, num>> series = [
      Series<double, int>(
        id: 'Expenses',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (value, index) => index,
        measureFn: (value, _) => value,
        data: data,
        strokeWidthPxFn: (_, __) => 4,
      )
    ];

    return LineChart(series,
      animate: false,
      selectionModels: [
        SelectionModelConfig(
          type: SelectionModelType.info,
          changedListener: _onSelection,
        )
      ],
      domainAxis: NumericAxisSpec(
          tickProviderSpec: StaticNumericTickProviderSpec(
              [
                TickSpec(0, label: '01'),
                TickSpec(3, label: '04'),
                TickSpec(6, label: '07'),
                TickSpec(9, label: '10'),
                TickSpec(11, label: '13'),
                TickSpec(14, label: '16'),
                TickSpec(17, label: '19'),
                TickSpec(20, label: '22'),
                TickSpec(23, label: '25'),
                TickSpec(26, label: '28'),
                TickSpec(29, label: '30'),
              ]
          )
      ),
      primaryMeasureAxis: NumericAxisSpec(
        tickProviderSpec: BasicNumericTickProviderSpec(
          desiredTickCount: 4,
        ),
      ),
    );
  }
}