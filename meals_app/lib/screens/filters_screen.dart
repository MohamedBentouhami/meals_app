import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

// ignore: use_key_in_widget_constructors
class FilterScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: const Center(
        child: Text('Test'),
      ),
      drawer: MainDrawer(),
    );
  }
}
