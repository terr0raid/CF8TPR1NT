import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/view/home/donations/model/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'donations_detail_view_model.g.dart';

class DonationsDetailViewModel = _DonationsDetailViewModelBase
    with _$DonationsDetailViewModel;

abstract class _DonationsDetailViewModelBase with Store, BaseViewModel {
  DonationModel? get donation => navigation.getRouteArgs<DonationModel>(ctx);

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {}

  @override
  void dispose() {}
}
