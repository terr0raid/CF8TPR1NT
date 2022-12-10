// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:app_settings/app_settings.dart';
import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mobx/mobx.dart';
part 'start_throw_view_model.g.dart';

class StartThrowViewModel = _StartThrowViewModelBase with _$StartThrowViewModel;

abstract class _StartThrowViewModelBase with Store, BaseViewModel {
  final fbs = FlutterBluetoothSerial.instance;

  List<List<int>> chunks = <List<int>>[];
  int contentLength = 0;
  Timer? timer;

  @observable
  BluetoothState btStatus = BluetoothState.UNKNOWN;

  @observable
  BluetoothConnection? connection;

  @observable
  BluetoothDevice? btDevice;

  //for image
  @observable
  Uint8List bytes = Uint8List(0);

  //for connecting to device
  @observable
  bool isConnecting = false;

  //for computing data from device
  @observable
  bool isListening = false;

  @computed
  bool get openDialog => !isBtEnabled || btDevice == null || connection == null;

  @computed
  bool get isBtEnabled => btStatus == BluetoothState.STATE_ON;

  @computed
  bool get isBtTurning =>
      btStatus == BluetoothState.STATE_TURNING_ON ||
      btStatus == BluetoothState.STATE_TURNING_OFF;

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    setBtState();
    fbs.onStateChanged().listen((BluetoothState state) {
      if (state == BluetoothState.STATE_OFF) {
        setBtStatus(value: state);
        setBtDevice(value: null);
      } else {
        setBtStatus(value: state);
      }
    });
  }

  Future<void> setBtState() async {
    await fbs.state.then((value) {
      setBtStatus(value: value);
    });
  }

  @override
  void dispose() {
    _dispose();
  }

  Future<void> _dispose() async {
    connection?.dispose();
    timer?.cancel();
  }

  Future<void> connectToBluetoothDevice() async {
    setIsConnecting(value: true);
    await fbs
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) async {
      if (bondedDevices.isNotEmpty) {
        for (final device in bondedDevices) {
          if (device.address == 'C0:49:EF:D4:42:02') {
            setBtDevice(value: device);
            setIsConnecting(value: false);
            break;
          }
        }
      }
    });
    if (btDevice == null) {
      await discoverBtDevice();
    }
    // if (btDevice != null) {
    //   await getBtConnection();
    // }
  }

  Future<void> discoverBtDevice() async {
    fbs.startDiscovery().listen((event) async {
      if (event.device.address == 'C0:49:EF:D4:42:02') {
        setBtDevice(value: event.device);
        await fbs.cancelDiscovery();
        setIsConnecting(value: false);
      }
    }).onDone(() async {
      await fbs.cancelDiscovery();
      setIsConnecting(value: false);
    });
  }

  @action
  Future<void> getBtConnection() async {
    try {
      connection = await BluetoothConnection.toAddress(btDevice?.address);
      connection?.input?.listen(_onDataReceived).onDone(() {
        setIsListening(value: false);
        setIsConnecting(value: false);
        if (timer != null) {
          if (timer!.isActive) timer?.cancel();
        }
        connection?.finish();
        connection = null;
        btDevice = null;
      });
    } catch (e) {
      // print(e);
      setIsListening(value: false);
    }
  }

  @action
  void drawImage() {
    if (chunks.isEmpty || contentLength == 0) return;

    bytes = Uint8List(contentLength);
    var offset = 0;
    for (final chunk in chunks) {
      bytes.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }

    contentLength = 0;
    chunks.clear();
    setIsListening(value: false);
  }

  void _onDataReceived(Uint8List data) {
    if (data.isNotEmpty) {
      if (timer != null) {
        if (timer!.isActive) timer?.cancel();
      }
      chunks.add(data);
      contentLength += data.length;
      timer = Timer(const Duration(milliseconds: 500), drawImage);
    }
  }

  Future<void> sendMessage({String text = '0'}) async {
    setIsListening(value: true);
    await getBtConnection();
    if (text.isNotEmpty) {
      try {
        connection?.output.add(Uint8List.fromList(utf8.encode(text.trim())));
        await connection?.output.allSent;
      } catch (e) {
        // print(e);
        setIsListening(value: false);
      }
    }
  }

  @action
  void setBtStatus({required BluetoothState value}) {
    btStatus = value;
  }

  @action
  void setBtDevice({required BluetoothDevice? value}) {
    btDevice = value;
  }

  @action
  void setIsConnecting({required bool value}) {
    isConnecting = value;
  }

  @action
  void setIsListening({required bool value}) {
    isListening = value;
  }

  Future<void> goToSettings() async {
    await AppSettings.openBluetoothSettings();
  }
}
