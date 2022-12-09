import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/firebase/auth_repository.dart';
import 'package:cf8tpr1nt/feature/widgets/svg/app_text_logo.dart';
import 'package:cf8tpr1nt/view/authentication/splash/service/splash_service.dart';
import 'package:cf8tpr1nt/view/authentication/splash/viewmodel/splash_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  late final SplashViewModel _viewModel;
  final ISplashService _splashService = SplashService(
    AuthRepository(FirebaseAuth.instance),
  );
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SplashViewModel(_splashService),
      onModelReady: (model) {
        _viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
      builder: (context, viewModel) => buildSplashBody,
    );
  }

  Widget get buildSplashBody {
    return Scaffold(
      body: buildSplashColumn,
    );
  }

  Widget get buildSplashColumn {
    return Padding(
      padding: context.paddingMediumVertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 2,
              child: buildAppLogo,
            ),
            Expanded(flex: 2, child: buildSplashIndicator),
          ],
        ),
      ),
    );
  }

  Widget get buildAppLogo {
    return Padding(
      padding: context.paddingNormal,
      child: AppTextLogo(
        height: dynamicHeight(0.1),
        width: dynamicWidth(0.3),
      ),
    );
  }

  Widget get buildSplashIndicator {
    return Observer(
      builder: (_) {
        return Center(
          child: Visibility(
            visible: _viewModel.isLoading,
            child: CircularProgressIndicator(
              color: context.colors.primary,
            ),
          ),
        );
      },
    );
  }
}
