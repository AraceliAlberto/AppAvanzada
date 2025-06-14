import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final String centerText;

  const MyPieChart({
    super.key,
    required this.dataMap,
    required this.centerText,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el valor total (sueldo)
    final double total = dataMap.values.reduce((a, b) => a + b);

    // Definir los colores dinámicos según excedentes
    final Map<String, Color> colorMap = {
      "50% Gastos fijos":
          (dataMap["50% Gastos fijos"] ?? 0) > total * 0.50
              ? const Color.fromRGBO(244, 67, 54, 1)
              : const Color.fromARGB(255, 49, 68, 51),
      "30% Gustos":
          (dataMap["30% Gustos"] ?? 0) > total * 0.30
              ? const Color.fromARGB(255, 255, 0, 0)
              : const Color.fromARGB(255, 112, 136, 110),

      "20% Ahorro":
          (dataMap["20% Ahorro"] ?? 0) < total * 0.20
              ? Color(0xFFC0C0C0)
              : Color(0xFFC0C0C0),
    };

    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 13,
      initialAngleInDegree: 60,
      centerText: centerText,
      colorList:
          dataMap.keys
              .map(
                (k) => colorMap[k] ?? const Color.fromARGB(255, 255, 255, 255),
              )
              .toList(),
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 2,
          color: Color.fromARGB(221, 206, 206, 206),
          wordSpacing: 10,
        ),
        legendShape: BoxShape.rectangle,
      ),
      chartRadius: MediaQuery.of(context).size.width / 1.35,
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesOutside: false,
        decimalPlaces: 2,
        chartValueStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(
            255,
            0,
            0,
            0,
          ), // Color opcional para mejor contraste
        ),
      ),
    );
  }
}
