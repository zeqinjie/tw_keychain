import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tw_keychain/tw_keychain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _twKeyChainPlugin = TwKeyChain();
  String _uuid = '';

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    _uuid = await _twKeyChainPlugin.fetchKeyChain(
      key: 'test_uuid',
      service: 'test_service',
    );
    if (_uuid.isEmpty) {
      _uuid = uuid;
      await _twKeyChainPlugin.saveKeyChain(
        key: 'test_uuid',
        value: _uuid,
        service: 'test_service',
      );
    }
    setState(() {});
  }

  /// Random UUID
  String get uuid {
    String randomStr = Random().nextInt(10).toString();
    for (var i = 0; i < 10; i++) {
      var str = Random().nextInt(10);
      randomStr = "$randomStr$str";
    }
    final timeNumber = DateTime.now().millisecondsSinceEpoch;
    final uuid = "$randomStr$timeNumber";
    return uuid;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_uuid'),
        ),
      ),
    );
  }
}
