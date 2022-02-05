import 'package:flutter/material.dart';
import 'package:mobileapp/cubit/search_cubit/search_cubit.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          SearchCubit cubit = context.watch();
          return const Center(
            child: Text("Search Page"),
          );
        },
      ),
    );
  }
}
