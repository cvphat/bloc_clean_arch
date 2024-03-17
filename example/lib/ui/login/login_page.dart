import 'package:auto_route/auto_route.dart';
import 'package:example/base/page_state.dart';
import 'package:example/ui/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageState<LoginPage, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Text('Login Page'),
        ),
      ),
    );
  }
}
