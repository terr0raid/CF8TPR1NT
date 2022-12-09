// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'containers_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContainersViewModel on _ContainersViewModelBase, Store {
  late final _$markersAtom =
      Atom(name: '_ContainersViewModelBase.markers', context: context);

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ContainersViewModelBase.isLoading', context: context);

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

  late final _$_addMarkersAsyncAction =
      AsyncAction('_ContainersViewModelBase._addMarkers', context: context);

  @override
  Future<void> _addMarkers() {
    return _$_addMarkersAsyncAction.run(() => super._addMarkers());
  }

  late final _$_ContainersViewModelBaseActionController =
      ActionController(name: '_ContainersViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_ContainersViewModelBaseActionController.startAction(
        name: '_ContainersViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_ContainersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers},
isLoading: ${isLoading}
    ''';
  }
}
