import 'package:auto_size_text/auto_size_text.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
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
      appBar: AppBar(
        title: AutoSizeText(
          model.donation!.name?.tr() ??
              LocaleKeys.home_donation_donationDetail_appBarTitle.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Visibility(
        visible: model.donation != null,
        replacement: const Text('Donation is not found'),
        child: SingleChildScrollView(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              children: [
                Image.asset(
                  model.donation?.image ?? '',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: context.height * 0.02),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          '${LocaleKeys.home_donation_donationDetail_type.tr()}: ',
                          style: context.textTheme.subtitle2,
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          model.donation!.type?.tr() ?? '?',
                          style: context.textTheme.caption,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(width: context.width * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          '${LocaleKeys.home_donation_donationDetail_establishment.tr()}: ',
                          style: context.textTheme.subtitle2,
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          model.donation!.establishment?.tr() ?? '?',
                          style: context.textTheme.caption,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                AutoSizeText(
                  model.donation!.description?.tr() ?? 'Donation Detail',
                  style: context.textTheme.bodyText1,
                ),
                SizedBox(height: context.height * 0.02),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.home_donation_donationDetail_donate.tr(),
                  ),
                ),
                SizedBox(height: context.height * 0.01),
                AutoSizeText(
                  LocaleKeys.home_donation_donationDetail_desc
                      .tr(args: [model.donation!.name?.tr() ?? '???']),
                  style: context.textTheme.caption,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
