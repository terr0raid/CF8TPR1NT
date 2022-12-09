// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_throw_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartThrowViewModel on _StartThrowViewModelBase, Store {
  Computed<bool>? _$openDialogComputed;

  @override
  bool get openDialog =>
      (_$openDialogComputed ??= Computed<bool>(() => super.openDialog,
              name: '_StartThrowViewModelBase.openDialog'))
          .value;
  Computed<bool>? _$isBtEnabledComputed;

  @override
  bool get isBtEnabled =>
      (_$isBtEnabledComputed ??= Computed<bool>(() => super.isBtEnabled,
              name: '_StartThrowViewModelBase.isBtEnabled'))
          .value;
  Computed<bool>? _$isBtTurningComputed;

  @override
  bool get isBtTurning =>
      (_$isBtTurningComputed ??= Computed<bool>(() => super.isBtTurning,
              name: '_StartThrowViewModelBase.isBtTurning'))
          .value;

  late final _$btStatusAtom =
      Atom(name: '_StartThrowViewModelBase.btStatus', context: context);

  @override
  BluetoothState get btStatus {
    _$btStatusAtom.reportRead();
    return super.btStatus;
  }

  @override
  set btStatus(BluetoothState value) {
    _$btStatusAtom.reportWrite(value, super.btStatus, () {
      super.btStatus = value;
    });
  }

  late final _$connectionAtom =
      Atom(name: '_StartThrowViewModelBase.connection', context: context);

  @override
  BluetoothConnection? get connection {
    _$connectionAtom.reportRead();
    return super.connection;
  }

  @override
  set connection(BluetoothConnection? value) {
    _$connectionAtom.reportWrite(value, super.connection, () {
      super.connection = value;
    });
  }

  late final _$btDeviceAtom =
      Atom(name: '_StartThrowViewModelBase.btDevice', context: context);

  @override
  BluetoothDevice? get btDevice {
    _$btDeviceAtom.reportRead();
    return super.btDevice;
  }

  @override
  set btDevice(BluetoothDevice? value) {
    _$btDeviceAtom.reportWrite(value, super.btDevice, () {
      super.btDevice = value;
    });
  }

  late final _$bytesAtom =
      Atom(name: '_StartThrowViewModelBase.bytes', context: context);

  @override
  Uint8List get bytes {
    _$bytesAtom.reportRead();
    return super.bytes;
  }

  @override
  set bytes(Uint8List value) {
    _$bytesAtom.reportWrite(value, super.bytes, () {
      super.bytes = value;
    });
  }

  late final _$isConnectingAtom =
      Atom(name: '_StartThrowViewModelBase.isConnecting', context: context);

  @override
  bool get isConnecting {
    _$isConnectingAtom.reportRead();
    return super.isConnecting;
  }

  @override
  set isConnecting(bool value) {
    _$isConnectingAtom.reportWrite(value, super.isConnecting, () {
      super.isConnecting = value;
    });
  }

  late final _$isListeningAtom =
      Atom(name: '_StartThrowViewModelBase.isListening', context: context);

  @override
  bool get isListening {
    _$isListeningAtom.reportRead();
    return super.isListening;
  }

  @override
  set isListening(bool value) {
    _$isListeningAtom.reportWrite(value, super.isListening, () {
      super.isListening = value;
    });
  }

  late final _$getBtConnectionAsyncAction =
      AsyncAction('_StartThrowViewModelBase.getBtConnection', context: context);

  @override
  Future<void> getBtConnection() {
    return _$getBtConnectionAsyncAction.run(() => super.getBtConnection());
  }

  late final _$_StartThrowViewModelBaseActionController =
      ActionController(name: '_StartThrowViewModelBase', context: context);

  @override
  void drawImage() {
    final _$actionInfo = _$_StartThrowViewModelBaseActionController.startAction(
        name: '_StartThrowViewModelBase.drawImage');
    try {
      return super.drawImage();
    } finally {
      _$_StartThrowViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBtStatus({required BluetoothState value}) {
    final _$actionInfo = _$_StartThrowViewModelBaseActionController.startAction(
        name: '_StartThrowViewModelBase.setBtStatus');
    try {
      return super.setBtStatus(value: value);
    } finally {
      _$_StartThrowViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBtDevice({required BluetoothDevice? value}) {
    final _$actionInfo = _$_StartThrowViewModelBaseActionController.startAction(
        name: '_StartThrowViewModelBase.setBtDevice');
    try {
      return super.setBtDevice(value: value);
    } finally {
      _$_StartThrowViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsConnecting({required bool value}) {
    final _$actionInfo = _$_StartThrowViewModelBaseActionController.startAction(
        name: '_StartThrowViewModelBase.setIsConnecting');
    try {
      return super.setIsConnecting(value: value);
    } finally {
      _$_StartThrowViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsListening({required bool value}) {
    final _$actionInfo = _$_StartThrowViewModelBaseActionController.startAction(
        name: '_StartThrowViewModelBase.setIsListening');
    try {
      return super.setIsListening(value: value);
    } finally {
      _$_StartThrowViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
btStatus: ${btStatus},
connection: ${connection},
btDevice: ${btDevice},
bytes: ${bytes},
isConnecting: ${isConnecting},
isListening: ${isListening},
openDialog: ${openDialog},
isBtEnabled: ${isBtEnabled},
isBtTurning: ${isBtTurning}
    ''';
  }
}
