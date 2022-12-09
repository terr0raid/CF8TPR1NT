// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProfileViewModelBase.isLoading', context: context);

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

  late final _$currentUserAtom =
      Atom(name: '_ProfileViewModelBase.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_ProfileViewModelBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$signOutAsyncAction =
      AsyncAction('_ProfileViewModelBase.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$getUserAsyncAction =
      AsyncAction('_ProfileViewModelBase.getUser', context: context);

  @override
  Future<void> getUser(String uid) {
    return _$getUserAsyncAction.run(() => super.getUser(uid));
  }

  late final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentUser: ${currentUser},
user: ${user}
    ''';
  }
}
