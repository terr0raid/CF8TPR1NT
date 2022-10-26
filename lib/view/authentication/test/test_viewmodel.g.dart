// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TestViewModel on _TestViewModelBase, Store {
  late final _$counterAtom =
      Atom(name: '_TestViewModelBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$localeAtom =
      Atom(name: '_TestViewModelBase.locale', context: context);

  @override
  String? get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(String? value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$_TestViewModelBaseActionController =
      ActionController(name: '_TestViewModelBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_TestViewModelBaseActionController.startAction(
        name: '_TestViewModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$_TestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
locale: ${locale}
    ''';
  }
}
