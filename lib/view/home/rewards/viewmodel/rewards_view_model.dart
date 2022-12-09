import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/view/home/rewards/model/reward_model.dart';
import 'package:cf8tpr1nt/view/home/rewards/service/rewards_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'rewards_view_model.g.dart';

class RewardsViewModel = _RewardsViewModelBase with _$RewardsViewModel;

abstract class _RewardsViewModelBase with Store, BaseViewModel {
  _RewardsViewModelBase(this.rewardsService);

  final RewardsService rewardsService;

  @observable
  List<RewardModel> rewards = <RewardModel>[];

  @observable
  bool isLoading = false;

  @observable
  String language = '';

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    getRewards();
  }

  @override
  void dispose() {}

  @action
  Future<void> getRewards() async {
    _changeIsLoading();
    language = ctx.locale.toLanguageTag();
    rewards = await rewardsService.getRewards(language);
    _changeIsLoading();
  }

  // @action
  // void setRewards() async {
  //   // await rewardsService.setReward(
  //   //   RewardModel(
  //   //     language: 'tr-TR',
  //   //     title: 'Atık Küre',
  //   //     description:
  //   //         'Atık Küre insan türünün Yerküre ve barındırdığı yaşamsal sistemler üzerinde yarattığı etkinin geniş bir tarihini sunuyor. Kitabın çevre meselelerinin tarihi konusunda yazılmış pek çok kitaptan farkı yazarın kontrolsüz nüfus artışı ve atık üretimi gibi temel iki sorunu sistem teorisi bağlamında ve karşılıklı etkileşimlerini merkeze koyarak ele almasıdır.',
  //   //     image: '',
  //   //     points: '2555',
  //   //     type: 'Kitap',
  //   //   ),
  //   // );
  // }

  @action
  void _changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> onRefresh() async {
    await getRewards();
  }

  Future<void> toRewardDetail(RewardModel item) async {
    await navigation.navigateToPage(
      path: NavigationConstants.REWARD_DETAIL_VIEW,
      arguments: item,
    );
  }
}
