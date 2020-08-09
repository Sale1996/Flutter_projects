import 'package:bitcoin_ticker/NetworkHelper.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var choosenValute;
  String BTCrate = '0.00';
  String ETHrate = '0.00';
  String LTCrate = '0.00';

  NetworkHelper networkHelper = NetworkHelper();

  Widget getAndroidDropDownButton() {
    List<DropdownMenuItem<String>> menuItems = List<DropdownMenuItem<String>>();
    for (String currency in currenciesList)
      menuItems
          .add(new DropdownMenuItem(child: Text(currency), value: currency));

    return DropdownButton(
      value: choosenValute,
      items: menuItems,
      onChanged: (value) {
        setState(() {
          choosenValute = value;
          getRates();
        });
      },
    );
  }

  Widget getIOSPicker() {
    List<Widget> pickerWidgets = List<Widget>();
    for (String currency in currenciesList) {
      pickerWidgets.add(Text(currency));
    }

    return CupertinoPicker(
      children: pickerWidgets,
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedItem) {
        setState(() {
          choosenValute = currenciesList[selectedItem];
          getRates();
        });
      },
    );
  }

  Widget getPickerWidget() {
    if (Platform.isIOS)
      return getIOSPicker();
    else if (Platform.isAndroid) return getAndroidDropDownButton();
  }

  void getRates() async {
    try {
      var BTCratee =
          await networkHelper.getRateOfByCurrency("BTC", choosenValute);
      var ETHratee =
          await networkHelper.getRateOfByCurrency("ETH", choosenValute);
      var LTCratee =
          await networkHelper.getRateOfByCurrency("LTC", choosenValute);

      setState(() {
        BTCrate = BTCratee;
        ETHrate = ETHratee;
        LTCrate = LTCratee;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget createCardWidget(String firstValue, String secondValute, String rate) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $firstValue = $rate $secondValute',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          createCardWidget(cryptoList[0], choosenValute, BTCrate),
          createCardWidget(cryptoList[1], choosenValute, ETHrate),
          createCardWidget(cryptoList[2], choosenValute, LTCrate),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPickerWidget(),
          ),
        ],
      ),
    );
  }
}
