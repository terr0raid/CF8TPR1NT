import 'package:auto_size_text/auto_size_text.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/base/widgets/box/standart_box.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys_index.dart';
import 'package:cf8tpr1nt/view/home/donations/donations_detail/viewmodel/donations_detail_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DonationsDetailView extends StatelessWidget {
  const DonationsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: DonationsDetailViewModel(),
      onModelReady: (model) {
        model
          ..init()
          ..setContext(context);
      },
      builder: buildScaffold,
    );
  }

  Scaffold buildScaffold(BuildContext context, DonationsDetailViewModel model) {
    return Scaffold(
      appBar: buildAppBar(model),
      body: buildBody(model, context),
    );
  }

  Widget buildBody(DonationsDetailViewModel model, BuildContext context) {
    return Visibility(
      visible: model.donation != null,
      replacement: buildNotFound(),
      child: SingleChildScrollView(
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            children: [
              buildDonationImage(model),
              SizedBox(height: context.height * 0.02),
              buildDonationSpecs(context, model),
              const Divider(
                thickness: 2,
              ),
              buildDonationDescription(model, context),
              SizedBox(height: context.height * 0.01),
              buildDonateButton(),
              SizedBox(height: context.height * 0.01),
              buildTerm(model, context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(DonationsDetailViewModel model) {
    return AppBar(
      title: AutoSizeText(
        model.donation!.name?.tr() ??
            LocaleKeys.home_donation_donationDetail_appBarTitle.tr(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Text buildNotFound() => const Text('Donation is not found');

  Image buildDonationImage(DonationsDetailViewModel model) {
    return Image.asset(
      model.donation?.image ?? '',
      width: 200,
      height: 200,
    );
  }

  Column buildDonationSpecs(
    BuildContext context,
    DonationsDetailViewModel model,
  ) {
    return Column(
      children: [
        buildType(context, model),
        SizedBox(width: context.width * 0.03),
        buildEstablishment(context, model),
      ],
    );
  }

  Row buildType(
    BuildContext context,
    DonationsDetailViewModel model,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTypeTitle(context),
        buildTypeText(model, context),
      ],
    );
  }

  AutoSizeText buildTypeTitle(BuildContext context) {
    return AutoSizeText(
      '${LocaleKeys.home_donation_donationDetail_type.tr()}: ',
      style: context.textTheme.subtitle2,
      maxLines: 1,
    );
  }

  AutoSizeText buildTypeText(
    DonationsDetailViewModel model,
    BuildContext context,
  ) {
    return AutoSizeText(
      model.donation!.type?.tr() ?? '?',
      style: context.textTheme.caption!.copyWith(
        color: context.colors.onSurface.withOpacity(0.6),
      ),
      maxLines: 1,
    );
  }

  Row buildEstablishment(BuildContext context, DonationsDetailViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildEstablishmentTitle(context),
        buildEstablishmentText(model, context),
      ],
    );
  }

  AutoSizeText buildEstablishmentTitle(BuildContext context) {
    return AutoSizeText(
      '${LocaleKeys.home_donation_donationDetail_establishment.tr()}: ',
      style: context.textTheme.subtitle2,
      maxLines: 1,
    );
  }

  AutoSizeText buildEstablishmentText(
    DonationsDetailViewModel model,
    BuildContext context,
  ) {
    return AutoSizeText(
      model.donation!.establishment?.tr() ?? '?',
      style: context.textTheme.caption!.copyWith(
        color: context.colors.onSurface.withOpacity(0.6),
      ),
      maxLines: 1,
    );
  }

  Widget buildDonationDescription(
    DonationsDetailViewModel model,
    BuildContext context,
  ) {
    return StandartBox(
      child: Padding(
        padding: context.paddingNormal,
        child: AutoSizeText(
          model.donation!.description?.tr() ?? 'Donation Detail',
          style: context.textTheme.bodyText1!.copyWith(
            color: context.colors.onSurface.withOpacity(0.6),
          ),
        ),
      ),
    );
  }

  ElevatedButton buildDonateButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        LocaleKeys.home_donation_donationDetail_donate.tr(),
      ),
    );
  }

  AutoSizeText buildTerm(
    DonationsDetailViewModel model,
    BuildContext context,
  ) {
    return AutoSizeText(
      LocaleKeys.home_donation_donationDetail_desc
          .tr(args: [model.donation!.name?.tr() ?? '???']),
      style: context.textTheme.caption!.copyWith(
        color: context.colors.onSurface.withOpacity(0.6),
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
