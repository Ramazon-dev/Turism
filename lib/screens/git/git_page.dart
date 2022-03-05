import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/data/git_data.dart';
import 'package:mobileapp/cubit/git_cubit/git_cubit.dart';
import 'package:mobileapp/screens/details/git_details.dart';
import 'package:mobileapp/services/git_service.dart';
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
          return FutureBuilder(
              future: GitService.fetchGitsByCity('toshkent'),
              builder: (ctx, AsyncSnapshot<List<Git>> snap) {
                if (snap.hasData) {
                  return _gitList(snap.data!);
                } else if (snap.hasError) {
                  return const Center(child: Text('Error'));
                }
                return Center(child: CupertinoActivityIndicator(radius: 32.w));
              });
        },
      ),
    );
  }

  ListView _gitList(List<Git> gitList) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        Git git = gitList[index];
        return MyGitListWidjet(git: git).onClick(() {
          CustomNavigator.push(GitDetailsPage(git: git));
        });
      },
      itemCount: gitList.length,
    );
  }
}
