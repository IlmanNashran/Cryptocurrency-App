import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map rates;

  const DetailsPage({required this.rates});

  @override
  Widget build(BuildContext context) {
    List _currencies =
        rates.keys.toList(); // create list for rates value and key
    List _exchangeRates = rates.values.toList();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (_context, _index) {
              String _currenciesString =
                  _currencies[_index].toString().toUpperCase();
              String _exchangeRatesString = _exchangeRates[_index].toString();
              return ListTile(
                title: Text(
                  "$_currenciesString : $_exchangeRatesString",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
