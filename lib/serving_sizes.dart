import 'package:flutter/material.dart';

class ServingSizes extends StatelessWidget {
  const ServingSizes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serving Sizes'),
      ),
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          children: const [
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Original Servings',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: 'Serving size',
              ),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              size: 30.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'New Servings',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: 'Serving size',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
