
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/data/food_categories.dart';
import 'package:shopping_app/model/food_category.dart';
import 'package:shopping_app/model/grocery_item.dart';

import 'package:http/http.dart' as http; 

class NewItem extends StatefulWidget{
  const NewItem({super.key});

@override
  State<NewItem> createState() {
    return _NewItemState();
  }

}
class _NewItemState extends State<NewItem>{
final formKey = GlobalKey<FormState>();
var entertedName = '';
var entertedQty = 1;
var selectedCategory = foodCategories[FoodCategories.vegetables]!;

void saveItem(){
  if (formKey.currentState!.validate()){
  formKey.currentState!.save();
  final uri = Uri.https(
  'flutter-shopping-72fdb-default-rtdb.asia-southeast1.firebasedatabase.app',
  'shopping-list.json',
  );

  http.post(
    uri,
    headers: {
      'content-Type': 'application/json'
    },
    body: json.encode({
      "name": entertedName, 
      "quantity": entertedQty, 
      "foodCategory": selectedCategory.title,
    }),
     
    );

  
  // Navigator.of(context).pop(
  //   GroceryItem(
  //     id: DateTime.now().toString(), 
  //   name: entertedName, 
  //   quantity: entertedQty, 
  //   foodCategory: selectedCategory,
  //   ),
  // );
}
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add grocery item'),
      ),
    body: Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          spacing: 15,
          children: [
            TextFormField(
              maxLength: 50,
              decoration: InputDecoration(
                label: Text('Name'),
              ),
              validator: (value){
               if (value==null || 
               value.isEmpty || 
               value.trim().length <= 1 || 
               value.trim().length > 50){
               return 'must be between 1 and 50';
               }
               return null;
              },
              onSaved: (value){
                entertedName = value!;
              },
            ),
            Row(
             crossAxisAlignment: CrossAxisAlignment.end,
             spacing: 10,
             children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('Quatity')
                  ),
                  initialValue: '1',
                  validator: (value){
               if (value==null || 
               value.isEmpty || 
               int.tryParse(value) == null || 
               int.tryParse(value)! < 0){
               return 'must be a valid positive number';
               }
               return null;
              },
              onSaved: (value){
                entertedQty = int.parse(value!);
              },
                ),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: selectedCategory,
                    items: [
                      for (final foodCategory in foodCategories.entries)
                      DropdownMenuItem(
                        value: foodCategory.value,
                        child: Row(
                          spacing: 10,
                          children: [
                           Container(
                            width: 16,
                            height: 16,
                            color: foodCategory.value.color,
                           ),
                           Text(foodCategory.value.title),
                          ],
                          ),
                        ),
                    ], 
                    onChanged: (value){
                     setState(() {
                       selectedCategory = value!;
                     });
                    },
                    ),
                  ),
             ],
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               TextButton(
                onPressed: (){}, 
                child: Text('reset'),
                ),
                ElevatedButton(
                  onPressed: saveItem, 
                  child: Text('add grocery'),
                  ),
             ],
            ),
          ],
        ),
        ),
      ),
    );
  }

}