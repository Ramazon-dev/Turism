import 'package:flutter/cupertino.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/git_cubit/git_cubit.dart';
import 'package:mobileapp/screens/details/git_details.dart';

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
              // City List Widget
              CityListWidget(
                onCityChanged: cubit.onCityChanged,
                cityName: cubit.city.name,
              ),
              FutureBuilder(
                  future: GitService.fetchGitsByCity(cubit.city.value),
                  builder: (ctx, AsyncSnapshot<List<Git>> snap) {
                    if (snap.hasData) {
                      if (snap.data!.isEmpty) {
                        return const EmptyPageWidget();
                      }
                      return _gitList(snap.data!);
                    } else if (snap.hasError) {
                      return const Center(child: Text('Error'));
                    } else if (snap.connectionState ==
                        ConnectionState.waiting) {
                      return _buildCenter();
                    }

                    return _buildCenter();
                  }),
            ],
          );
        },
      ),
    );
  }

  Center _buildCenter() {
    return Center(child: CupertinoActivityIndicator(radius: 32.w));
  }

  Expanded _gitList(List<Git> gitList) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          Git git = gitList[index];
          return MyGitListWidjet(git: git).onClick(() {
            CustomNavigator.push(GitDetailsPage(git: git));
          });
        },
        itemCount: gitList.length,
      ),
    );
  }
}
