import 'package:cf8tpr1nt/view/home/rewards/model/reward_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IRewardsService {
  IRewardsService(this.firestore);
  final FirebaseFirestore firestore;

  Future<List<RewardModel>> getRewards(String query);
  Future<void> setReward(RewardModel reward);
}

class RewardsService extends IRewardsService {
  RewardsService(super.firestore);

  @override
  Future<List<RewardModel>> getRewards(String query) {
    return firestore
        .collection('rewards')
        .withConverter(
          fromFirestore: RewardModel.fromFirestore,
          toFirestore: (RewardModel rewardModel, _) =>
              rewardModel.toFirestore(),
        )
        .where('language', isEqualTo: query)
        .get()
        .then((QuerySnapshot<RewardModel> querySnapshot) {
      return querySnapshot.docs
          .map((QueryDocumentSnapshot<RewardModel> doc) => doc.data())
          .toList();
    });
  }

  @override
  Future<void> setReward(RewardModel reward) {
    return firestore
        .collection('rewards')
        .withConverter(
          fromFirestore: RewardModel.fromFirestore,
          toFirestore: (RewardModel rewardModel, _) =>
              rewardModel.toFirestore(),
        )
        .add(reward);
  }
}
