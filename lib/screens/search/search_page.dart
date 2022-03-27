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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PlacePage();
  }
}
