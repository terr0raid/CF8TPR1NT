import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys_index.dart';
import 'package:cf8tpr1nt/view/home/startthrow/viewmodel/start_throw_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StartThrowView extends StatefulWidget {
  const StartThrowView({super.key});

  @override
  State<StartThrowView> createState() => _StartThrowViewState();
}

class _StartThrowViewState extends BaseState<StartThrowView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        viewModel.setBtState();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
    }
  }

  late final StartThrowViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: StartThrowViewModel(),
      onModelReady: (model) {
        viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
      builder: (context, viewModel) => buildStartThrowScaffold,
      onDispose: (model) => model.dispose,
    );
  }

  Scaffold get buildStartThrowScaffold {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_startThrow_appBarTitle.tr()),
      ),
      body: buildBody,
    );
  }

  Widget get buildBody {
    return Center(
      child: Observer(
        builder: (_) {
          return Visibility(
            visible: viewModel.openDialog,
            replacement: buildBodyContent,
            child: buildAlertDialog,
          );
        },
      ),
    );
  }

  Widget get buildBodyContent {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: viewModel.isListening
              ? null
              : () async {
                  await viewModel.sendMessage();
                },
          child: const Text('I take it'),
        ),
        if (viewModel.bytes.isNotEmpty)
          Image.memory(viewModel.bytes, fit: BoxFit.cover),
      ],
    );
  }

  Widget get buildAlertDialog {
    return AlertDialog(
      title: Text(LocaleKeys.home_startThrow_dialogTitle.tr()),
      content: Text(LocaleKeys.home_startThrow_dialogDesc.tr()),
      elevation: 24,
      actions: <Widget>[
        TextButton(
          onPressed: viewModel.isBtTurning
              ? null
              : viewModel.isBtEnabled
                  ? null
                  : () async {
                      await viewModel.goToSettings();
                    },
          child: Text(LocaleKeys.home_startThrow_dialogButton2.tr()),
        ),
        TextButton(
          onPressed: viewModel.isBtTurning || !viewModel.isBtEnabled
              ? null
              : () async {
                  await viewModel.connectToBluetoothDevice();
                },
          child: Text(LocaleKeys.home_startThrow_dialogButton.tr()),
        ),
        // TextButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   child: Text(LocaleKeys.home_startThrow_dialogCancel.tr()),
        // ),
      ],
    );
  }
}
