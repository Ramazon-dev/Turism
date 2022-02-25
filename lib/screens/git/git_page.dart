import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/git_data.dart';
import 'package:mobileapp/cubit/git_cubit/git_cubit.dart';
import 'package:mobileapp/screens/details/git_details.dart';
import 'package:mobileapp/widgets/top_bar/appbar_widget.dart';
import 'package:mobileapp/widgets/git_list_widjet.dart';

class GitPage extends StatelessWidget {
  const GitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => GitCubit(),
      child: BlocBuilder<GitCubit, GitState>(
        builder: (context, state) {
          GitCubit cubit = context.watch();
          return Column(
            children: [
              Container(
                height: getHeight(632),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (__) => GitDetailsPage(git: GitData.git)));
                      },
                      child: MyGitListWidjet(git: GitData.git),
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
