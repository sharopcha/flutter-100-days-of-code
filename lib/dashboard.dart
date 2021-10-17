import 'package:flutter/material.dart';
import 'components/custom_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('100 Days Code'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: CustomButton(
                width: _width,
                text: 'Day 1',
              ),
            ),
          ],
        ),
      )),
    );
  }
}
