import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CurrencyConversionForm extends StatefulWidget {
  @override
  _CurrencyConversionFormState createState() => _CurrencyConversionFormState();
}

class _CurrencyConversionFormState extends State<CurrencyConversionForm> {
  TextEditingController amountController = TextEditingController();
  double convertedAmount = 0.0;
  List<String> currencies = ['USD', 'EUR', 'GBP', 'JPY', 'IDR'];

  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  List<FlSpot> currencyValueData = [
    FlSpot(0, 3),
    FlSpot(1, 4),
    FlSpot(2, 3.5),
    FlSpot(3, 3.8),
    FlSpot(4, 4.2),
    FlSpot(5, 4.0),
  ];
  // Faktor konversi (misalnya, 1 USD ke EUR)
  double conversionRate = 0.85;

  void convertCurrency() {
    double amount = double.tryParse(amountController.text) ?? 0.0;

    // Perbarui nilai konversi untuk IDR
    if (fromCurrency == 'IDR') {
      conversionRate = 1.0 / conversionRate;
    }

    double result = amount * conversionRate;

    // Kembalikan faktor konversi ke nilai semula jika asal mata uang bukan IDR
    if (fromCurrency == 'IDR') {
      conversionRate = 1.0 / conversionRate;
    }

    setState(() {
      convertedAmount = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Jumlah'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: fromCurrency,
              items: currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  fromCurrency = newValue!;
                });
              },
            ),
            Icon(Icons.arrow_forward),
            DropdownButton<String>(
              value: toCurrency,
              items: currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  toCurrency = newValue!;
                });
              },
            ),
          ],
        ),
        ElevatedButton(
          onPressed: convertCurrency,
          child: Text('Konversi'),
        ),
        Text(convertedAmount.toStringAsFixed(2)),
      ],
    );
  }
}
