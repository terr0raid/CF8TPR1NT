import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys_index.dart';
import 'package:cf8tpr1nt/feature/constants/image_paths.dart';
import 'package:cf8tpr1nt/view/home/donations/model/donation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'donations_view_model.g.dart';

class DonationsViewModel = _DonationsViewModelBase with _$DonationsViewModel;

abstract class _DonationsViewModelBase with Store, BaseViewModel {
  @observable
  List<DonationModel> donations = <DonationModel>[];

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    setDonations();
  }

  @override
  void dispose() {}

  @action
  void setDonations() {
    donations.addAll([
      DonationModel(
        name: LocaleKeys.home_donation_institutions_tema_name,
        description: LocaleKeys.home_donation_institutions_tema_description,
        image: ImagePaths.instance.temaLogo,
        establishment: LocaleKeys.home_donation_institutions_tema_establishment,
        type: LocaleKeys.home_donation_institutions_tema_type,
      ),
      DonationModel(
        name: LocaleKeys.home_donation_institutions_tskgv_name,
        description: LocaleKeys.home_donation_institutions_tskgv_description,
        image: ImagePaths.instance.tskgvLogo,
        establishment:
            LocaleKeys.home_donation_institutions_tskgv_establishment,
        type: LocaleKeys.home_donation_institutions_tskgv_type,
      ),
      DonationModel(
        name: LocaleKeys.home_donation_institutions_tskmv_name,
        description: LocaleKeys.home_donation_institutions_tskmv_description,
        image: ImagePaths.instance.tskmehmetcikLogo,
        establishment:
            LocaleKeys.home_donation_institutions_tskmv_establishment,
        type: LocaleKeys.home_donation_institutions_tskmv_type,
      ),
    ]);
  }
}
