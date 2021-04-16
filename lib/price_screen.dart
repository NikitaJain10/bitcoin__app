import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_new_widget.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = 'INR';
  Map<String, String> ratesMap = {};
  bool isWaiting = true;

  void getRates() async {
    isWaiting = true;
    try {
      var rates = await coinData.getExchangeRate(selectedCurrency);
      setState(() {
        if (rates != null) {
          isWaiting = false;
          ratesMap = rates;
        }
      });
    } catch (e) {
      return;
    }
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      items.add(DropdownMenuItem(child: Text(currency), value: currency));
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: items,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getRates();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getRates();
      },
      children: items,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRates();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

          home: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('image/crypto.jpg'),
    fit: BoxFit.cover,
    ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,

    appBar: AppBar(
        title: Text('CryptoCurrency App'),
        centerTitle: true,
      ),
      body:/* Image(
        Image:
          NetworkImage()
      )*/
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18, 30,18,30),
            child: buildColumn(),
          ),
          Container(
              height: 100.0,
              //width: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.blue,
              child: Platform.isIOS ? iOSPicker() : androidDropDown()),
        ],
      ),
    ),
    ),
    );
  }

  Column buildColumn() {
    List<CardNew> cardnewlists = [];
    for (String currency1 in cryptoList) {
      cardnewlists.add(CardNew(
          currencyRate: isWaiting ? '?' : ratesMap[currency1],
          selectedCurrency: selectedCurrency,
          currency1: currency1));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cardnewlists,
    );
  }
}


