// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RewardsDetailViewModel on _RewardsDetailViewModelBase, Store {
  Computed<bool>? _$isEnoughPointsComputed;

  @override
  bool get isEnoughPoints =>
      (_$isEnoughPointsComputed ??= Computed<bool>(() => super.isEnoughPoints,
              name: '_RewardsDetailViewModelBase.isEnoughPoints'))
          .value;
  Computed<int>? _$remainingPointsComputed;

  @override
  int get remainingPoints =>
      (_$remainingPointsComputed ??= Computed<int>(() => super.remainingPoints,
              name: '_RewardsDetailViewModelBase.remainingPoints'))
          .value;

  late final _$userPointAtom =
      Atom(name: '_RewardsDetailViewModelBase.userPoint', context: context);

  @override
  int? get userPoint {
    _$userPointAtom.reportRead();
    return super.userPoint;
  }

  @override
  set userPoint(int? value) {
    _$userPointAtom.reportWrite(value, super.userPoint, () {
      super.userPoint = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RewardsDetailViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getUserPointAsyncAction =
      AsyncAction('_RewardsDetailViewModelBase.getUserPoint', context: context);

  @override
  Future<void> getUserPoint() {
    return _$getUserPointAsyncAction.run(() => super.getUserPoint());
  }

  late final _$claimRewardAsyncAction =
      AsyncAction('_RewardsDetailViewModelBase.claimReward', context: context);

  @override
  Future<void> claimReward() {
    return _$claimRewardAsyncAction.run(() => super.claimReward());
  }

  late final _$_RewardsDetailViewModelBaseActionController =
      ActionController(name: '_RewardsDetailViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_RewardsDetailViewModelBaseActionController
        .startAction(name: '_RewardsDetailViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_RewardsDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userPoint: ${userPoint},
isLoading: ${isLoading},
isEnoughPoints: ${isEnoughPoints},
remainingPoints: ${remainingPoints}
    ''';
  }
}
