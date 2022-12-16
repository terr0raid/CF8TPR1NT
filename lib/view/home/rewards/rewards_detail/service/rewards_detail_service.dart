import 'package:cf8tpr1nt/feature/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IRewardsDetailService {
  IRewardsDetailService(this._firestore);
  final FirebaseFirestore _firestore;

  Future<int?> getUserPoint(String uid);
  Future<void> claimReward();
}

class RewardsDetailService extends IRewardsDetailService {
  RewardsDetailService(super.firestore);

  @override
  Future<int?> getUserPoint(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (model, options) {
            return model.toFirestore();
          },
        )
        .get()
        .then(
          (value) => value.data()?.points,
        );
  }

  @override
  Future<void> claimReward() {
    throw UnimplementedError();
  }
}
