import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobileapp/cubit/search_cubit/search_cubit.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/search_servis.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> categoriya = [
    "Ресторан.",
    "Транспорт.",
    "obekt",
    "hotel",
    "гит"
  ];

  int istap = 0;

  List<String> surovjoy = ["restaurant", "transport", "object", "hotel", "git"];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      children: [
        Container(
          height: getHeight(174),
          color: AppColors.primary,
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: getHeight(58), bottom: getHeight(20)),
                height: getHeight(32),
                child: ListView.builder(
                    itemCount: categoriya.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (() {
                          istap = index;
                          setState(() {});
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.symmetric(horizontal: getHeight(2.5)),
                          height: getHeight(32),
                          width: getWidth(67),
                          decoration: BoxDecoration(
                              color: istap == index
                                  ? AppColors.white
                                  : AppColors.primary,
                              border: Border.all(
                                  color: AppColors.white, width: getWidth(1)),
                              borderRadius: BorderRadius.circular(getWidth(9))),
                          child: Text(
                            categoriya[index],
                            style: TextStyle(
                              fontSize: getWidth(10),
                              color: istap == index
                                  ? AppColors.primary
                                  : AppColors.white,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Form(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: getWidth(20), left: getWidth(20)),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        validator: (v) {},
                        onChanged: (value) {},
                        scrollPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          hintText: 'Найти',
                          suffixIcon: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: AppColors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getHeight(55),
          child: FutureBuilder(
              future:
                  SearchServis().getSearch(controller.text, surovjoy[istap]),
              builder: (context, AsyncSnapshot snap) {
                if (snap.hasError) {
                  print("===========");
                  return Container(
                    child: ListView.builder(itemBuilder: (context, index) {
                      switch (snap.data) {
                        case Restaurant:
                          return Container(child: Text(snap.data!.toString()));
                        default:
                          return Container();
                      }
                    }),
                  );
                } else {
                  return Text("Hech narsa yo'q");
                }
              }),
        )
      ],
    );
  }
}
