import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/currency_model.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: LocaleKeys.enterPrice.tr()),
      body: FutureBuilder(
        future: CurrencyService.getCurrencyList(),
        builder: (context, AsyncSnapshot<List<CurrencyModel>> snap) {
          if (snap.hasData) {
            debugPrint(snap.data![7].title.toString());
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.h),
              child: Column(
                children: [
                  Text(
                    'Здесь вы можете определить сумму денег, которая вас устраивает.',
                    style: AppTextStyle.medium(size: 18.h),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dollarContainerMethod(
                          dollar: '1.\$', text: snap.data![23].title),
                      sumContainerMethod(
                          summa: snap.data![23].nbuBuyPrice, text: "В сумах"),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dollarContainerMethod(
                          dollar: '1.₽', text: snap.data![18].title),
                      sumContainerMethod(
                          summa: snap.data![18].nbuBuyPrice, text: "В сумах"),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dollarContainerMethod(
                          dollar: '1.€', text: snap.data![7].title),
                      sumContainerMethod(
                          summa: snap.data![7].nbuBuyPrice, text: "В сумах"),
                    ],
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 424,
                  //   child: _showBody(snap.data!),
                  // ),
                ],
              ),
            );
          } else if (snap.hasError) {
            return const Center(child: Text('Error'));
          }
          return const Center(
            child: CupertinoActivityIndicator(radius: 65.0),
          );
        },
      ),
    );
  }

  Container sumContainerMethod({required String summa, required String text}) {
    return Container(
      padding: EdgeInsets.only(left: 15.h, top: 10.h),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(summa, style: AppTextStyle.medium()),
          Text(text, style: AppTextStyle.regular()),
        ],
      ),
      height: 55.h,
      width: 145.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.currenceGrey,
      ),
    );
  }

  Container dollarContainerMethod(
      {required String dollar, required String text}) {
    return Container(
      padding: EdgeInsets.only(left: 15.h, top: 10.h),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dollar, style: AppTextStyle.medium()),
          Text(text, style: AppTextStyle.regular()),
        ],
      ),
      height: 55.h,
      width: 145.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.currenceGrey,
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
