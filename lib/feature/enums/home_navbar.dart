// ignore_for_file: constant_identifier_names

import 'package:cf8tpr1nt/core/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:cf8tpr1nt/view/authentication/login/view/login_view.dart';
import 'package:cf8tpr1nt/view/authentication/onboard/view/onboard_view.dart';
import 'package:cf8tpr1nt/view/home/containers/view/containers_view.dart';
import 'package:cf8tpr1nt/view/home/donations/view/donations_view.dart';
import 'package:cf8tpr1nt/view/home/profile/view/profile_view.dart';
import 'package:cf8tpr1nt/view/home/rewards/view/rewards_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum NavbarTab {
  CONTAINER,
  REWARDS,
  DONATION,
  PROFILE,
}

extension NavbarTabExtension on NavbarTab {
  String? get name {
    switch (this) {
      case NavbarTab.CONTAINER:
        return LocaleKeys.home_build_bottomnavbar_containers.tr();
      case NavbarTab.REWARDS:
        return LocaleKeys.home_build_bottomnavbar_rewards.tr();
      case NavbarTab.DONATION:
        return LocaleKeys.home_build_bottomnavbar_donation.tr();
      case NavbarTab.PROFILE:
        return LocaleKeys.home_build_bottomnavbar_profile.tr();
    }
  }

  IconData get icon {
    switch (this) {
      case NavbarTab.CONTAINER:
        return Icons.travel_explore;
      case NavbarTab.REWARDS:
        return Icons.card_giftcard;
      case NavbarTab.DONATION:
        return Icons.volunteer_activism;
      case NavbarTab.PROFILE:
        return Icons.face;
    }
  }

  Widget get page {
    switch (this) {
      case NavbarTab.CONTAINER:
        return const ContainersView();
      case NavbarTab.REWARDS:
        return const RewardsView();
      case NavbarTab.DONATION:
        return const DonationsView();
      case NavbarTab.PROFILE:
        return const ProfileView();
    }
  }

  String get route {
    switch (this) {
      case NavbarTab.CONTAINER:
        return NavigationConstants.CONTAINERS_VIEW;
      case NavbarTab.REWARDS:
        return NavigationConstants.REWARDS_VIEW;
      case NavbarTab.DONATION:
        return NavigationConstants.DONATION_VIEW;
      case NavbarTab.PROFILE:
        return NavigationConstants.PROFILE_VIEW;
    }
  }
}
