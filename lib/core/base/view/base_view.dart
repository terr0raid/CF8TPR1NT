import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.builder,
    required this.onModelReady,
    this.onDispose,
  });
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;

  final dynamic Function(T model) onModelReady;
  final VoidCallback? onDispose;

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    super.initState();
    widget.onModelReady(widget.viewModel);
    model = widget.viewModel;
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, model);
  }
}
