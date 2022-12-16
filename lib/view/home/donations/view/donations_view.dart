import 'package:auto_size_text/auto_size_text.dart';
import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/base/widgets/box/icon_box.dart';
import 'package:cf8tpr1nt/core/base/widgets/box/standart_box.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys_index.dart';
import 'package:cf8tpr1nt/view/home/donations/model/donation_model.dart';
import 'package:cf8tpr1nt/view/home/donations/viewmodel/donations_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DonationsView extends StatefulWidget {
  const DonationsView({super.key});

  @override
  State<DonationsView> createState() => _DonationsViewState();
}

class _DonationsViewState extends BaseState<DonationsView> {
  late DonationsViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: DonationsViewModel(),
      builder: (context, viewModel) => buildDonationsBody,
      onModelReady: (model) {
        viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
    );
  }

  Widget get buildDonationsBody {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_donation_appBarTitle.tr()),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            IconBox(
              color: context.colors.tertiary.withOpacity(0.6),
              icon: const Icon(Icons.info_outline),
              child: Padding(
                padding: context.paddingLow,
                child: AutoSizeText(
                  LocaleKeys.home_donation_desc.tr(),
                  style: context.textTheme.subtitle1!.copyWith(
                    color: context.colors.surface,
                  ),
                ),
              ),
            ),
            buildDonationList,
          ],
        ),
      ),
    );
  }

  Widget get buildDonationList {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: viewModel.donations.length,
      itemBuilder: (context, index) {
        final item = viewModel.donations[index];
        return buildListTile(item);
      },
    );
  }

  Widget buildListTile(DonationModel item) {
    return StandartBox(
      height: context.height * 0.13,
      child: ListTile(
        leading: buildListTileLeading(item.image!),
        title: buildListTileTitle(item.name?.tr()),
        subtitle: buildListTileSubtitle(item.description?.tr()),
        trailing: buildListTileTrailing(item),
      ),
    );
  }

  Widget buildListTileLeading(String imageUrl) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Colors.transparent,
      child: Image.asset(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget buildListTileTrailing(DonationModel item) {
    return IconButton(
      onPressed: () async {
        await viewModel.toDetailPage(item);
      },
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  Widget buildListTileSubtitle(String? description) {
    return AutoSizeText(
      description ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.subtitle1!.copyWith(
        color: context.colors.onSurface.withOpacity(0.6),
      ),
    );
  }

  Widget buildListTileTitle(String? title) {
    return AutoSizeText(
      title ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      minFontSize: 18,
      style: context.textTheme.subtitle1!.copyWith(
        color: context.colors.onSurface,
      ),
    );
  }
}
