import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/currency_model.dart';
import 'package:mobileapp/services/currency_service.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: LocaleKeys.enterPrice.tr()),
      body: FutureBuilder(
        future: CurrencyService.getCurrencyList(),
        builder: (context,AsyncSnapshot<List<CurrencyModel>> snap) {
          if (snap.hasData) {
            return _showBody(snap.data!);
          } else if (snap.hasError) {
            return const Center(child: Text('Error'));
          }
          return const Center(
            child:  CupertinoActivityIndicator(radius: 65.0),
          );
        },
      ),
    );
  }

  _showBody(List<CurrencyModel> currencies) => ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (ctx, i) {
    CurrencyModel currency = currencies[i];
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(currency.code)),
        title: Text(currency.title),
        subtitle: Text(currency.date),
        trailing: Text(currency.cbPrice),
      ),
    );
  });
}
