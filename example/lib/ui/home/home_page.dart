import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:example/base/page_state.dart';
import 'package:example/ui/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_state.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageState<HomePage, HomeBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(state.count.toString());
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CommonBloc, CommonState>(
        builder: (context, state) {
          return Visibility(
            visible: !state.isLoading,
            child: FloatingActionButton(
              onPressed: () {
                bloc.add(
                  Plus1Emitted(),
                );
              },
              child: const Icon(Icons.plus_one_outlined),
            ),
          );
        },
      ),
    );
  }
}
