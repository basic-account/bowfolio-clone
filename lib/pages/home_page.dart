import 'package:flutter/material.dart';

import '../widgets/profiles_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TESTING'),
      ),
      body: ProfilesList(),
    );
  }
}