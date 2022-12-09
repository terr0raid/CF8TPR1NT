// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donations_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DonationsViewModel on _DonationsViewModelBase, Store {
  late final _$donationsAtom =
      Atom(name: '_DonationsViewModelBase.donations', context: context);

  @override
  List<DonationModel> get donations {
    _$donationsAtom.reportRead();
    return super.donations;
  }

  @override
  set donations(List<DonationModel> value) {
    _$donationsAtom.reportWrite(value, super.donations, () {
      super.donations = value;
    });
  }

  late final _$_DonationsViewModelBaseActionController =
      ActionController(name: '_DonationsViewModelBase', context: context);

  @override
  void setDonations() {
    final _$actionInfo = _$_DonationsViewModelBaseActionController.startAction(
        name: '_DonationsViewModelBase.setDonations');
    try {
      return super.setDonations();
    } finally {
      _$_DonationsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
donations: ${donations}
    ''';
  }
}
