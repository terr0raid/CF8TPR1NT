import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys_index.dart';
import 'package:cf8tpr1nt/view/home/rewards/rewards_detail/viewmodel/rewards_detail_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RewardsDetailView extends StatelessWidget {
  const RewardsDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: RewardsDetailViewModel(),
      onModelReady: (model) {
        model
          ..setContext(context)
          ..init();
      },
      builder: buildScaffold,
    );
  }

  Scaffold buildScaffold(
    BuildContext context,
    RewardsDetailViewModel viewModel,
  ) {
    return Scaffold(
      appBar: buildAppBar(viewModel),
      body: Visibility(
        visible: viewModel.reward != null,
        replacement: buildNotFound(),
        child: buildMainSection(context, viewModel),
      ),
    );
  }

  Text buildNotFound() {
    return Text(
      LocaleKeys.home_rewards_rewardDetail_notFoundReward.tr(),
    );
  }

  SingleChildScrollView buildMainSection(
    BuildContext context,
    RewardsDetailViewModel viewModel,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRewardSection(viewModel, context),
            const Divider(
              thickness: 2,
            ),
            buildDescriptionSection(viewModel, context),
            SizedBox(
              height: context.height * 0.05,
            ),
            buildClaimRewardSection(viewModel, context)
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(RewardsDetailViewModel viewModel) {
    return AppBar(
      title: Text(
        viewModel.reward?.title ??
            LocaleKeys.home_rewards_rewardDetail_notFoundReward.tr(),
      ),
    );
  }

  Row buildRewardSection(
    RewardsDetailViewModel viewModel,
    BuildContext context,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: viewModel.reward!.image != null,
          child: SizedBox(
            height: context.height * 0.25,
            width: context.width * 0.33,
            child: CachedNetworkImage(
              imageUrl: viewModel.reward!.image!,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: SizedBox(
            height: context.height * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildRewardTitle(viewModel, context),
                buildRewardSpecs(viewModel, context)
              ],
            ),
          ),
        ),
      ],
    );
  }

  AutoSizeText buildRewardTitle(
    RewardsDetailViewModel viewModel,
    BuildContext context,
  ) {
    return AutoSizeText(
      viewModel.reward!.title ?? 'No title',
      maxLines: 2,
      style: context.textTheme.headline6!.copyWith(
        color: context.colors.onSurface,
      ),
    );
  }

  Column buildRewardSpecs(
    RewardsDetailViewModel viewModel,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AutoSizeText(
              '${LocaleKeys.home_rewards_rewardDetail_points.tr()}: ',
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            AutoSizeText(
              viewModel.reward!.points.toString(),
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colors.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
        Row(
          children: [
            AutoSizeText(
              '${LocaleKeys.home_rewards_rewardDetail_category.tr()}: ',
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            AutoSizeText(
              viewModel.reward!.type.toString(),
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colors.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }

  AutoSizeText buildDescriptionSection(
    RewardsDetailViewModel viewModel,
    BuildContext context,
  ) {
    return AutoSizeText(
      viewModel.reward!.description ?? 'No description',
      style: context.textTheme.bodyText1!.copyWith(
        color: context.colors.onSurface.withOpacity(0.8),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildClaimRewardSection(
    RewardsDetailViewModel viewModel,
    BuildContext context,
  ) {
    return Center(
      child: Visibility(
        visible: viewModel.isLoading,
        replacement: const CircularProgressIndicator(),
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                buildClaimRewardButton(viewModel),
                SizedBox(
                  height: context.height * 0.03,
                ),
                buildTerm(viewModel, context),
              ],
            );
          },
        ),
      ),
    );
  }

  ElevatedButton buildClaimRewardButton(RewardsDetailViewModel viewModel) {
    return ElevatedButton(
      onPressed: viewModel.isEnoughPoints
          ? () {
              viewModel.claimReward();
            }
          : null,
      child: Text(
        LocaleKeys.home_rewards_rewardDetail_claimReward.tr(),
      ),
    );
  }

  Widget buildTerm(
    RewardsDetailViewModel viewModel,
    BuildContext context,
  ) {
    return AutoSizeText(
      viewModel.isEnoughPoints
          ? LocaleKeys.home_rewards_rewardDetail_desc.plural(
              viewModel.remainingPoints,
            )
          : LocaleKeys.home_rewards_rewardDetail_cantGetDesc
              .plural(viewModel.remainingPoints),
      maxLines: 2,
      style: context.textTheme.bodySmall!.copyWith(
        color: context.colors.onSurface.withOpacity(0.6),
      ),
      textAlign: TextAlign.center,
    );
  }
}
