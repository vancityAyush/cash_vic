import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ControllerView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ControllerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ControllerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
