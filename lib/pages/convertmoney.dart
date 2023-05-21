import 'package:finalproject/components/palettes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class MoneyConverter extends StatefulWidget {
  const MoneyConverter({Key? key}) : super(key: key);

  @override
  State<MoneyConverter> createState() => _MoneyConverterState();
}

class _MoneyConverterState extends State<MoneyConverter> {
  late double input;
  late double output;
  late String currencyInput;
  late String currencyOutput;
  late String result;
  String _time = '';
  String _zone = 'WIB';

  TextEditingController _moneyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _time = DateFormat('MM/dd/yyy hh:mm:ss').format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer time) => _getTime());
    input = 0;
    currencyInput = 'IDR';
    currencyOutput = 'IDR';
    result = '';
  }

  void onInputChanged(String value) {
    setState(() {
      input = double.tryParse(value) ?? 0;
    });
  }

  void onCurrencyInputChanged(String? value) {
    setState(() {
      currencyInput = value ?? 'IDR';
    });
  }

  void onCurrencyOutputChanged(String? value) {
    setState(() {
      currencyOutput = value ?? 'IDR';
    });
  }

  void convert() {
    setState(() {
      switch (currencyInput) {
        case 'IDR':
          switch (currencyOutput) {
            case 'IDR':
              output = input;
              break;
            case 'USD':
              output = input / 14200;
              break;
            case 'EUR':
              output = input / 17000;
              break;
          }
          break;
        case 'USD':
          switch (currencyOutput) {
            case 'IDR':
              output = input * 14200;
              break;
            case 'USD':
              output = input;
              break;
            case 'EUR':
              output = input * 0.85;
              break;
          }
          break;
        case 'EUR':
          switch (currencyOutput) {
            case 'IDR':
              output = input * 17000;
              break;
            case 'USD':
              output = input * 1.17;
              break;
            case 'EUR':
              output = input;
              break;
          }
          break;
      }
      result = output.toStringAsFixed(2);
    });
  }

  void _getTime() {
    final utc = DateTime.now().toUtc();
    final localTime = utc.add(_getOffset(_zone));
    final formatDateTime =
        DateFormat('EEEE, MM/dd/yyy hh:mm:ss').format(localTime);
    if (this.mounted) {
      setState(() {
        _time = formatDateTime;
      });
    }
  }

  Duration _getOffset(String zone) {
    if (zone == 'WIB') {
      return Duration(hours: 7);
    }

    if (zone == 'WITA') {
      return Duration(hours: 8);
    }

    return Duration(hours: 9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Money Converter')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Select zone :"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _zone == 'WIB'
                            ? null
                            : () {
                                setState(() {
                                  _zone = 'WIB';
                                });
                              },
                        child: Text('WIB')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: _zone == 'WITA'
                            ? null
                            : () {
                                setState(() {
                                  _zone = 'WITA';
                                });
                              },
                        child: Text('WITA')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: _zone == 'WIT'
                          ? null
                          : () {
                              setState(() {
                                _zone = 'WIT';
                              });
                            },
                      child: Text('WIT'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '${_time} ${_zone}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    onChanged: onInputChanged,
                    controller: _moneyController,
                    decoration: InputDecoration(
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton(
                  value: currencyInput,
                  items: const <String>['IDR', 'USD', 'EUR']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: onCurrencyInputChanged,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("to"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  child: Text(result),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.mainColor),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                SizedBox(width: 10),
                DropdownButton(
                  value: currencyOutput,
                  items: const <String>['IDR', 'USD', 'EUR']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: onCurrencyOutputChanged,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: convert,
              child: const Text('Convert'),
            )
          ],
        ),
      ),
    );
  }
}
