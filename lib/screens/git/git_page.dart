import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/git_cubit/git_cubit.dart';
import 'package:mobileapp/screens/details/git_details.dart';
import 'package:mobileapp/widgets/navigators/drawer_widget.dart';
import 'package:mobileapp/widgets/top_bar/app_bar_with_list.dart';

class GitPage extends StatefulWidget {
  GitPage({Key? key, required this.changedCity}) : super(key: key);
  CityModel changedCity;

  @override
  State<GitPage> createState() => _GitPageState();
}

class _GitPageState extends State<GitPage> with TickerProviderStateMixin {
  late TabController _tabController;
 late  int _currentIndex;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _currentIndex =
        CityList.cities.indexOf((widget.changedCity));
    super.initState();
    _tabController = TabController(length: CityList.cities.length, vsync: this, initialIndex: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GitCubit(),
      child: BlocBuilder<GitCubit, GitState>(
        builder: (context, state) {
          GitCubit cubit = context.watch();
          return Scaffold(
            key: _scaffoldKey,
            drawer: const DrawerWidget(),
            appBar: AppBarWithList(
              onTabChanged: _onTabChanged,
              tabController: _tabController,
              title: LocaleKeys.git.tr(),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
            body: FutureBuilder(
                future: GitService.fetchGitsByCity(
                  CityList.cities[_currentIndex].value,
                ),
                builder: (ctx, AsyncSnapshot<List<Git>> snap) {
                  if (snap.hasData) {
                    if (snap.data!.isEmpty) {
                      return const EmptyPageWidget();
                    }
                    return _gitList(snap.data!);
                  } else if (snap.hasError) {
                    return const Center(child: Text('Error'));
                  } else if (snap.connectionState == ConnectionState.waiting) {
                    return _buildCenter();
                  }

                  return _buildCenter();
                }),
          );
        },
      ),
    );
  }

  void _onTabChanged(i) {
    setState(() {
      _currentIndex = i;
    });
  }

  Center _buildCenter() {
    return Center(child: CupertinoActivityIndicator(radius: 32.w));
  }

  ListView _gitList(List<Git> gitList) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        Git git = gitList[index];
        return MyGitListWidget(git: git).onClick(() {
          CustomNavigator.push(GitDetailsPage(git: git));
        });
      },
      itemCount: gitList.length,
    );
  }
}
