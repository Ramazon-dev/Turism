import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobileapp/cubit/search_cubit/search_cubit.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          SearchCubit cubit = context.watch();
          return Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    validator: (v) {},
                    onChanged: (value) {},
                    scrollPadding: const EdgeInsets.symmetric(horizontal: 16),
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
                  // const Text("Search Page"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
