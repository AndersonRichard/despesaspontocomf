import 'package:flutter/material.dart';

class HomeBottomButton extends StatelessWidget {
  const HomeBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navegar para a tela de adicionar despesa
      },
      child: const Icon(Icons.add),
    );
  }
}