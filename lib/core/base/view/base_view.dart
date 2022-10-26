import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;

  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const BaseView({
    super.key,
    required this.viewModel,
    required this.builder,
    required this.onModelReady,
    this.onDispose,
  });

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(widget.viewModel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, model);
  }
}
