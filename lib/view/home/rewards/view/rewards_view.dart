import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/base/widgets/box/standart_box.dart';
import 'package:cf8tpr1nt/core/base/widgets/skeleton/list_tile_skeleton.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:cf8tpr1nt/view/home/rewards/model/reward_model.dart';
import 'package:cf8tpr1nt/view/home/rewards/service/rewards_service.dart';
import 'package:cf8tpr1nt/view/home/rewards/viewmodel/rewards_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';

class RewardsView extends StatefulWidget {
  const RewardsView({super.key});

  @override
  State<RewardsView> createState() => _RewardsViewState();
}

class _RewardsViewState extends BaseState<RewardsView> {
  late RewardsViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: RewardsViewModel(RewardsService(FirebaseFirestore.instance)),
      builder: (context, viewModel) => buildRewardsScaffold,
      onModelReady: (model) {
        viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
    );
  }

  Widget get buildRewardsScaffold {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_rewards_appBarTitle.tr()),
      ),
      body: buildRewardsBody,
    );
  }

  Widget get buildRewardsBody {
    return Observer(
      builder: (_) {
        if (viewModel.isLoading) {
          return buildShimmerList;
        }
        return RefreshIndicator(
          onRefresh: viewModel.onRefresh,
          child: SizedBox.expand(
            child: buildRewardsList,
          ),
        );
      },
    );
  }

  Widget get buildRewardsList {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: viewModel.rewards.length,
      itemBuilder: (context, index) {
        final item = viewModel.rewards[index];
        return buildListTile(item);
      },
    );
  }

  Widget buildListTile(RewardModel item) {
    final haveImageUrl = item.image != '' && item.image != null;
    return StandartBox(
      child: Padding(
        padding: context.paddingLowVertical,
        child: ListTile(
          leading: haveImageUrl
              ? buildListTileLeading(item.image!)
              : const Icon(Icons.image),
          title: buildListTileTitle(item.title),
          subtitle: buildListTileSubtitle(item.description),
          trailing: buildListTileTrailing(item),
        ),
      ),
    );
  }

  CircleAvatar buildListTileLeading(String imageUrl) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.transparent,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
      ),
    );
  }

  Widget buildListTileTrailing(RewardModel item) {
    return ElevatedButton(
      onPressed: () async {
        await viewModel.toRewardDetail(item);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            '${item.points ?? 'none'} pt',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }

  Widget buildListTileSubtitle(String? description) {
    return AutoSizeText(
      description ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.subtitle2!.copyWith(
        color: context.colors.onSurface.withOpacity(0.6),
      ),
    );
  }

  Widget buildListTileTitle(String? title) => AutoSizeText(
        title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.headline6!.copyWith(
          color: context.colors.onSurface,
        ),
      );

  Widget get buildShimmerList {
    return Padding(
      padding: context.paddingLow,
      child: buildShimmerBody,
    );
  }

  Widget get buildShimmerBody {
    return SizedBox.expand(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext ctx, index) {
          return buildRewardsShimmerSkeleton;
        },
      ),
    );
  }

  Widget get buildRewardsShimmerSkeleton {
    return Shimmer.fromColors(
      baseColor: context.colors.secondary.withOpacity(0.5),
      highlightColor: context.colors.primary,
      period: context.normalDuration,
      child: const ListTileSkeleton(size: 20),
    );
  }
}
