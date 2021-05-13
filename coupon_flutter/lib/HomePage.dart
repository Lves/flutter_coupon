import 'package:flutter/material.dart';
import 'Widgets/LLGridView.dart';
import 'Widgets/GoodsGridView.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LLGridView(),
          GoodsGridView()
        ],
      )
    );
  }
}