// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$isGoogleLoadingAtom =
      Atom(name: '_LoginViewModelBase.isGoogleLoading', context: context);

  @override
  bool get isGoogleLoading {
    _$isGoogleLoadingAtom.reportRead();
    return super.isGoogleLoading;
  }

  @override
  set isGoogleLoading(bool value) {
    _$isGoogleLoadingAtom.reportWrite(value, super.isGoogleLoading, () {
      super.isGoogleLoading = value;
    });
  }

  late final _$isFacebookLoadingAtom =
      Atom(name: '_LoginViewModelBase.isFacebookLoading', context: context);

  @override
  bool get isFacebookLoading {
    _$isFacebookLoadingAtom.reportRead();
    return super.isFacebookLoading;
  }

  @override
  set isFacebookLoading(bool value) {
    _$isFacebookLoadingAtom.reportWrite(value, super.isFacebookLoading, () {
      super.isFacebookLoading = value;
    });
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void _changeGoogleLoading() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase._changeGoogleLoading');
    try {
      return super._changeGoogleLoading();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeFacebookLoading() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase._changeFacebookLoading');
    try {
      return super._changeFacebookLoading();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isGoogleLoading: ${isGoogleLoading},
isFacebookLoading: ${isFacebookLoading}
    ''';
  }
}
