import 'dart:developer';

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
  List<TextEditingController> oldIngredientControllers = [];
  List<TextEditingController> newIngredientControllers = [];
  final newServingSize = TextEditingController();
  final originalServingSize = TextEditingController();
  ValueNotifier<double> ratio = ValueNotifier(0);

  @override
  initState() {
    super.initState();
    ratio.addListener(() {
      for (var ingredient in oldIngredientControllers) {
        int index = oldIngredientControllers.indexOf(ingredient);

        if (ingredient.text.isNotEmpty && int.parse(ingredient.text) != 0) {
          if (ratio.value != 0) {
            if (ingredient.text.isNotEmpty) {
              double newIngredientValue =
                  (double.parse(ingredient.text) * ratio.value.toDouble())
                      .toDouble();
              newIngredientControllers[index].text = newIngredientValue % 1 == 0
                  ? newIngredientValue.toInt().toString()
                  : newIngredientValue.toStringAsFixed(1);
            } else {
              newIngredientControllers[index].text = "";
            }
          }
        }
      }
    });
  }

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
                  controller: originalServingSize,
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
                  onChanged: (text) {
                    if (text.isNotEmpty) {
                      ratio.value = int.parse(newServingSize.text) /
                          int.parse(originalServingSize.text);
                      log("$ratio");
                    }
                  },
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
                  controller: newServingSize,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'New Servings',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    alignLabelWithHint: true,
                    hintText: 'Serving size',
                  ),
                  onChanged: (text) {
                    if (text.isNotEmpty) {
                      ratio.value = int.parse(newServingSize.text) /
                          int.parse(originalServingSize.text);
                      log("$ratio");
                    }
                  },
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
                    _dialogBuilder(context);
                  },
                  child: const Text("Add Ingredient"))
            ],
          ),
        ],
      ),
    );
  }

  _buildRow(index) {
    oldIngredientControllers.add(TextEditingController());
    newIngredientControllers.add(TextEditingController());
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        // Remove the item from the data source.
        setState(() {
          ingredients.removeAt(index);
          oldIngredientControllers.removeAt(index);
          newIngredientControllers.removeAt(index);
          reversedIngredients = ingredients.reversed.toList();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: oldIngredientControllers[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: ingredients[index].name,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                hintText: ingredients[index].unit,
                suffix: Align(
                  widthFactor: 0,
                  child: Text(ingredients[index].unit),
                ),
                suffixStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              onChanged: (text) {
                if (text.isNotEmpty) {
                  double newIngredientValue =
                      (int.parse(text) * ratio.value).toDouble();
                  newIngredientControllers[index].text =
                      newIngredientValue % 1 == 0
                          ? newIngredientValue.toInt().toString()
                          : newIngredientValue.toStringAsFixed(1);
                } else {
                  newIngredientControllers[index].text = "";
                }
              },
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
              readOnly: true,
              controller: newIngredientControllers[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: ingredients[index].name,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                alignLabelWithHint: true,
                hintText: ingredients[index].unit,
                suffix: Align(
                  widthFactor: 0,
                  child: Text(ingredients[index].unit),
                ),
                suffixStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final ingredient = TextEditingController();
    final unit = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Add ingredient',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: ingredient,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: "Ingredient name",
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    alignLabelWithHint: true,
                    hintText: "Ingredient name",
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: unit,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: "Unit",
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    alignLabelWithHint: true,
                    hintText: "Kg, dl, amount",
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () {
                ingredients.insert(
                    ingredients.length, Ingredient(ingredient.text, unit.text));
                reversedIngredients = ingredients.reversed.toList();
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Discard'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
