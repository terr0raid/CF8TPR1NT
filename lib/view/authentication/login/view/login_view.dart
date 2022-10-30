import 'package:flutter/material.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../viewmodel/login_view_model.dart';

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
        model.setContext(context);
        model.init();
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
