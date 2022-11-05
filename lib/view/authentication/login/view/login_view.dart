import 'package:auto_size_text/auto_size_text.dart';
import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/firebase/auth_repository.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:cf8tpr1nt/feature/constants/image_paths.dart';
import 'package:cf8tpr1nt/feature/widgets/svg/app_logo_text.dart';
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
            child: AppLogoWithText(
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
      child: ElevatedButton(
        onPressed: () {
          viewModel.googleSignIn();
        },
        child: Observer(
          builder: (_) {
            return SizedBox(
              width: context.width * 0.9,
              height: context.height * 0.08,
              child: viewModel.isGoogleLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: context.colors.primary,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildButtonLogo(ImagePaths.instance.googleLogo),
                        SizedBox(width: context.width * 0.04),
                        buildButtonText(LocaleKeys.auth_google),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget get buildFacebookButton {
    return Padding(
      padding: context.paddingLow,
      child: ElevatedButton(
        onPressed: () {
          viewModel.facebookSignIn();
        },
        child: Observer(
          builder: (_) {
            return SizedBox(
              width: context.width * 0.9,
              height: context.height * 0.08,
              child: viewModel.isFacebookLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: context.colors.primary,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildButtonLogo(ImagePaths.instance.facebookLogo),
                        SizedBox(width: context.width * 0.04),
                        buildButtonText(LocaleKeys.auth_facebook),
                      ],
                    ),
            );
          },
        ),
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
      style: context.textTheme.headline6,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
