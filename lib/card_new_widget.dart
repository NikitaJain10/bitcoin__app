import 'package:flutter/material.dart';

class CardNew extends StatelessWidget {
  const CardNew(
      {Key key,
      @required this.currencyRate,
      @required this.selectedCurrency,
      @required this.currency1});

  final String currencyRate;
  final String selectedCurrency;
  final String currency1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 15.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Text(
          '1 $currency1 = $currencyRate $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
