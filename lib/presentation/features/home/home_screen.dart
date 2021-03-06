import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../wrapper.dart';
import '../../widgets/widgets.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppScaffold(
      background: null,
      title: null,
      body: BlocProvider<HomeBloc>(
          create: (context) {
            return HomeBloc()..add(HomeLoadEvent());
          },
          child: HomeWrapper()),
      bottomMenuIndex: 0,
    ));
  }
}

class HomeWrapper extends StatefulWidget {
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends AppWrapperState<HomeWrapper> {
  //State createState() => AppWrapperState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return getPageView(<Widget>[
        Main1View(
          changeView: changePage,
        ),
        Main2View(
          changeView: changePage,
        ),
        Main3View(changeView: changePage)
      ]);
    });
  }
}
