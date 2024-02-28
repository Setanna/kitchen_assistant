import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServingSizes extends StatefulWidget {
  const ServingSizes({super.key});

  @override
  ServingSizesState createState() => ServingSizesState();
}

class Ingredient {
  final String name;
  final String unit;

  Ingredient(this.name, this.unit);
}

class ServingSizesState extends State<ServingSizes> {
  List<Ingredient> ingredients = [Ingredient("Minced Meat", "kg")];
  List<Ingredient> reversedIngredients = [Ingredient("Minced Meat", "kg")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serving Sizes'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Original Servings',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    alignLabelWithHint: true,
                    hintText: 'Serving size',
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 30.0,
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'New Servings',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    alignLabelWithHint: true,
                    hintText: 'Serving size',
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reversedIngredients.length,
              key: UniqueKey(),
              itemBuilder: (context, index) => _buildRow(index),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ingredients.insert(
                        ingredients.length, Ingredient("test", "test"));
                    reversedIngredients = ingredients.reversed.toList();
                    setState(() {});
                  },
                  child: const Text("Add Ingredient"))
            ],
          ),
        ],
      ),
    );
  }

  _buildRow(index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        // Remove the item from the data source.
        setState(() {
          ingredients.removeAt(index);
          reversedIngredients = ingredients.reversed.toList();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: ingredients[index].name,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                hintText: 'Original Ingredient',
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Icon(
              Icons.arrow_forward_rounded,
              size: 30.0,
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              enabled: false,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'New Ingredient',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                hintText: 'New Ingredient',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
