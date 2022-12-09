import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: constant_identifier_names
enum RewardsEnum { BOOK, ELECTRONICS, GIFT }

extension RewardsEnumExtension on RewardsEnum {
  String get name {
    switch (this) {
      case RewardsEnum.BOOK:
        return LocaleKeys.home_rewards_categories_book.tr();
      case RewardsEnum.ELECTRONICS:
        return LocaleKeys.home_rewards_categories_electronics.tr();
      case RewardsEnum.GIFT:
        return LocaleKeys.home_rewards_categories_gift.tr();
    }
  }
}
