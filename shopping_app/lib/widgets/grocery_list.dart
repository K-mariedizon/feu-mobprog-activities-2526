import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_items.dart';
import 'package:shopping_app/model/grocery_item.dart';
import 'package:shopping_app/widgets/new_item.dart';

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

  void removedItem(GroceryItem item){
    setState(() {
      groceryItems.remove(item);
    });
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
              color: groceryItems[index].foodCategory.color,
            ),
            trailing: Text(groceryItems[index].quantity.toString()),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Grocery'),
        actions: [
          IconButton(
            onPressed: () {
              additem();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
