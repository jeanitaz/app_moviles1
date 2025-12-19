import 'package:flutter/material.dart';

class Sinopsis extends StatelessWidget {
  const Sinopsis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinopsis'),
      ),
      body: const Center(
        child: Text('Sinopsis'),
      ),
    );
  }
}