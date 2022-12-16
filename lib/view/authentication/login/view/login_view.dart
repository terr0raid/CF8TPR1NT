import 'package:auto_size_text/auto_size_text.dart';
import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/base/widgets/buttons/login_button_with_icon.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/firebase/auth_repository.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:cf8tpr1nt/feature/constants/app/image_paths.dart';
import 'package:cf8tpr1nt/feature/widgets/svg/app_text_logo.dart';
import 'package:cf8tpr1nt/view/authentication/login/service/login_service.dart';
import 'package:cf8tpr1nt/view/authentication/login/viewmodel/login_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late Image backgroundImage;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset(
      ImagePaths.instance.loginBg,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
  }

  late LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LoginViewModel(
        LoginService(
          AuthRepository(FirebaseAuth.instance),
        ),
      ),
      builder: (context, viewModel) => buildLoginBody(),
      onModelReady: (model) {
        model
          ..setContext(context)
          ..init();
        viewModel = model;
      },
    );
  }

  Widget buildLoginBody() {
    return Scaffold(
      backgroundColor: context.colors.outline,
      body: Stack(
        children: [
          buildLoginBackground,
          buildLoginColumn,
        ],
      ),
    );
  }

  Widget get buildLoginColumn {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Padding(
            padding: context.paddingNormal,
            child: AppTextLogo(
              height: dynamicHeight(0.1),
              width: dynamicWidth(0.3),
            ),
          ),
          const Spacer(),
          buildGoogleButton,
          buildFacebookButton,
          SizedBox(height: context.height * 0.1),
          ElevatedButton(
            onPressed: () {
              AuthRepository(FirebaseAuth.instance).signOut();
            },
            child: const Text('signout'),
          ),
        ],
      ),
    );
  }

  Widget get buildGoogleButton {
    return Padding(
      padding: context.paddingLow,
      child: Observer(
        builder: (_) {
          return LoginButtonWithIcon(
            size: Size(context.width * 0.85, context.height * 0.07),
            label: buildButtonText(LocaleKeys.auth_google.tr()),
            icon: SvgPicture.asset(
              ImagePaths.instance.googleLogo,
              height: dynamicHeight(0.04),
            ),
            onPressed: () {
              try {
                viewModel.googleSignIn();
              } on Exception {
                context.showSnackBar(
                  LocaleKeys.auth_loginError.tr(),
                );
              }
            },
            isLoading: viewModel.isGoogleLoading,
          );
        },
      ),
    );
  }

  Widget get buildFacebookButton {
    return Padding(
      padding: context.paddingLow,
      child: Observer(
        builder: (_) {
          return LoginButtonWithIcon(
            size: Size(context.width * 0.85, context.height * 0.07),
            label: buildButtonText(LocaleKeys.auth_facebook.tr()),
            icon: SvgPicture.asset(
              ImagePaths.instance.facebookLogo,
              height: dynamicHeight(0.04),
            ),
            onPressed: () {
              try {
                viewModel.facebookSignIn();
              } on Exception {
                context.showSnackBar(
                  LocaleKeys.auth_loginError.tr(),
                );
              }
            },
            isLoading: viewModel.isFacebookLoading,
          );
        },
      ),
    );
  }

  Widget get buildLoginBackground {
    return Opacity(
      opacity: 0.3,
      child: backgroundImage,
    );
  }

  SvgPicture buildButtonLogo(String path) {
    return SvgPicture.asset(
      path,
      height: 28,
      width: 28,
    );
  }

  Widget buildButtonText(String text) {
    return AutoSizeText(
      text.tr(),
      style: context.textTheme.headline6!.copyWith(
        color: context.colors.onSurface,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }
}
