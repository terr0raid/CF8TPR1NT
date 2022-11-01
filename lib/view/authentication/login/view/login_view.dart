import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/view/authentication/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late LoginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LoginViewModel(),
      builder: (context, viewModel) => _buildLoginPage(),
      onModelReady: (model) {
        model
          ..setContext(context)
          ..init();
        viewModel = model;
      },
    );
  }

  Widget _buildLoginPage() {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // viewModel.navigateToHome();
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
