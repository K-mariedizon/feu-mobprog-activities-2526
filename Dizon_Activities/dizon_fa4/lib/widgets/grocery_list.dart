import 'package:dizon_fa4/commons/gradient_container.dart';
import 'package:dizon_fa4/commons/styled_text.dart';
import 'package:dizon_fa4/data/food_categories.dart';
import 'package:flutter/material.dart';
import 'package:dizon_fa4/data/dummy_items.dart';
import 'package:dizon_fa4/model/grocery_item.dart';
import 'package:dizon_fa4/widgets/new_item.dart';
import 'package:dizon_fa4/chart/chart.dart';


class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  void additem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      groceryItems.add(newItem);
    });
  }

  void removedItem(HouseItem item){
     final itemIndex = groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Item deleted.',),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              groceryItems.insert(itemIndex, item);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
     child: Text('NO items added'),
    );

    if (groceryItems.isNotEmpty){
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction){
            removedItem(groceryItems[index]);
          },
          key: ValueKey(groceryItems[index].id),
          child: ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: houseCategories[groceryItems[index].houseCategory]!.color,

            ),
            trailing: Row(
                 mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${groceryItems[index].quantity}',
                style: const TextStyle(fontSize: 16),
               ),
              const SizedBox(width: 6),
               Text(
               houseCategories[groceryItems[index].houseCategory]!.title,
               style: const TextStyle(
                 fontSize: 14,
                color: Colors.white70,
             ),
      ),
    ],
  ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: StyledText('My House Inventory', 25, Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              additem();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          const GradientContainer(
            Color.fromARGB(255, 116, 11, 111),
            Color.fromARGB(255, 207, 157, 197),
          ),Column(
         children: [
            SizedBox(
           height: 200, 
          child: Chart(expenses: groceryItems), 
         ),
         Expanded(
          child: content, 
        ),
  ],
),
],
      ),
    );
  }
}
