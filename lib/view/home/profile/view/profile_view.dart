import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/firebase/auth_repository.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys_index.dart';
import 'package:cf8tpr1nt/core/init/provider/home_tab_provider.dart';
import 'package:cf8tpr1nt/view/home/profile/service/profile_service.dart';
import 'package:cf8tpr1nt/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  late ProfileViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ProfileViewModel(
        ProfileService(
          AuthRepository(FirebaseAuth.instance),
          FirebaseFirestore.instance,
        ),
      ),
      onModelReady: (model) {
        viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
      builder: (context, viewModel) => buildProfileBody,
    );
  }

  Widget get buildProfileBody {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_profile_appBarTitle.tr()),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            return Visibility(
              visible: !viewModel.isLoading ||
                  viewModel.user != null ||
                  viewModel.currentUser != null,
              replacement: const CircularProgressIndicator(),
              child: Column(
                children: [
                  buildUserProfile,
                  buildPointsButton,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get buildPointsButton {
    return Padding(
      padding: context.paddingLow + context.paddingNormalHorizontal,
      child: ElevatedButton(
        onPressed: () {
          context.read<HomeTabbarProvider>().setIndex(2);
        },
        child: buildUserProfilePoints,
      ),
    );
  }

  Widget get buildUserProfile {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildUserProfileLeft,
          IconButton(
            onPressed: () async {
              await bottomSheetModal;
              // await viewModel.navigateToSettings();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  Future<dynamic> get bottomSheetModal {
    return showModalBottomSheet(
      backgroundColor: context.colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: context.colors.onSurface,
                  ),
                  title: AutoSizeText(
                    LocaleKeys.settings_core_langTitle.tr(),
                    style: context.textTheme.subtitle2,
                  ),
                  subtitle: AutoSizeText(
                    LocaleKeys.settings_core_langDesc.tr(),
                    style: context.textTheme.subtitle2!.copyWith(
                      color: context.colors.onSurface.withOpacity(0.6),
                    ),
                  ),
                  onTap: () async {
                    viewModel
                      ..changeLanguage()
                      ..goBack();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.color_lens,
                    color: context.colors.onSurface,
                  ),
                  title: AutoSizeText(
                    LocaleKeys.settings_core_themeTitle.tr(),
                    style: context.textTheme.subtitle2,
                  ),
                  subtitle: AutoSizeText(
                    LocaleKeys.settings_core_themeDesc.tr(),
                    style: context.textTheme.subtitle2!.copyWith(
                      color: context.colors.onSurface.withOpacity(0.6),
                    ),
                  ),
                  onTap: () async {
                    viewModel
                      ..changeTheme()
                      ..goBack();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: context.colors.onSurface,
                  ),
                  title: AutoSizeText(
                    LocaleKeys.settings_exit.tr(),
                    style: context.textTheme.subtitle2,
                  ),
                  onTap: () async {
                    await viewModel.signOut();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get buildUserProfileLeft {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildUserProfileImage,
        buildUserProfileInfo,
      ],
    );
  }

  Widget get buildUserProfileImage {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        radius: context.width * 0.12,
        backgroundImage: CachedNetworkImageProvider(
          viewModel.currentUser!.photoURL!,
        ),
      ),
    );
  }

  Widget get buildUserProfileInfo {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            viewModel.currentUser!.displayName!,
            style: context.textTheme.headline6!.copyWith(
              color: context.colors.onSurface,
            ),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          AutoSizeText(
            viewModel.currentUser!.email!,
            style: context.textTheme.subtitle2!.copyWith(
              color: context.colors.onSurface.withOpacity(0.6),
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget get buildUserProfilePoints {
    return Center(
      child: AutoSizeText(
        LocaleKeys.home_profile_points.plural(viewModel.user?.points ?? 0),
        maxLines: 1,
      ),
    );
  }
}
