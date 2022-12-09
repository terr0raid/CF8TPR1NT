import 'package:cf8tpr1nt/core/init/firebase/firebase_service.dart';
import 'package:cf8tpr1nt/view/home/containers/model/container_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IContainersService {
  IContainersService(this._firebaseService);
  final FirebaseService _firebaseService;
  Future<List<ContainerModel>?> getContainers();
}

class ContainersService extends IContainersService {
  ContainersService(super.firebaseService);

  @override
  Future<List<ContainerModel>?> getContainers() {
    return _firebaseService.firestore
        .collection('containers')
        .withConverter(
          fromFirestore: ContainerModel.fromFirestore,
          toFirestore: (ContainerModel containerModel, _) =>
              containerModel.toFirestore(),
        )
        .get()
        .then((QuerySnapshot<ContainerModel> querySnapshot) {
      return querySnapshot.docs
          .map((QueryDocumentSnapshot<ContainerModel> doc) => doc.data())
          .toList();
    });
  }
}
