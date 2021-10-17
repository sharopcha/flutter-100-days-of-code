import 'package:flutter/material.dart';
import 'package:flutter_100_days/components/moving_card.dart';

class CardFlip extends StatelessWidget {
  const CardFlip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 1 Credit Card Flip'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: MovingCard(
            frontUrl: 'assets/bank_cards/1_front.png',
            backUrl: 'assets/bank_cards/1_back.png',
          ),
        ),
      ),
    );
  }
}
