import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({required this.isTrue, Key? key, required this.onPressed})
      : super(key: key);
  final bool isTrue;
  final void Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () => onPressed(isTrue),
        style: ElevatedButton.styleFrom(
          primary: isTrue ? Color(0xff4cAf52) : Color(0xfff54335),
        ),
        child: Text(
          isTrue ? 'Туура' : 'Туура эмес',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
