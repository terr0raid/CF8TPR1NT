// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RewardsViewModel on _RewardsViewModelBase, Store {
  late final _$rewardsAtom =
      Atom(name: '_RewardsViewModelBase.rewards', context: context);

  @override
  List<RewardModel> get rewards {
    _$rewardsAtom.reportRead();
    return super.rewards;
  }

  @override
  set rewards(List<RewardModel> value) {
    _$rewardsAtom.reportWrite(value, super.rewards, () {
      super.rewards = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RewardsViewModelBase.isLoading', context: context);

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

  late final _$languageAtom =
      Atom(name: '_RewardsViewModelBase.language', context: context);

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$getRewardsAsyncAction =
      AsyncAction('_RewardsViewModelBase.getRewards', context: context);

  @override
  Future<void> getRewards() {
    return _$getRewardsAsyncAction.run(() => super.getRewards());
  }

  late final _$onRefreshAsyncAction =
      AsyncAction('_RewardsViewModelBase.onRefresh', context: context);

  @override
  Future<void> onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  late final _$_RewardsViewModelBaseActionController =
      ActionController(name: '_RewardsViewModelBase', context: context);

  @override
  void _changeIsLoading() {
    final _$actionInfo = _$_RewardsViewModelBaseActionController.startAction(
        name: '_RewardsViewModelBase._changeIsLoading');
    try {
      return super._changeIsLoading();
    } finally {
      _$_RewardsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rewards: ${rewards},
isLoading: ${isLoading},
language: ${language}
    ''';
  }
}
