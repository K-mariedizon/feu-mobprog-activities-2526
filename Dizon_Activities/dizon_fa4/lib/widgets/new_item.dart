
import 'package:dizon_fa4/commons/gradient_container.dart';
import 'package:dizon_fa4/commons/styled_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dizon_fa4/data/food_categories.dart';
import 'package:dizon_fa4/model/food_category.dart';
import 'package:dizon_fa4/model/grocery_item.dart';

//import 'package:http/http.dart' as http; 

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
var selectedCategory = HouseCategories.grocery;

void saveItem(){
  if (formKey.currentState!.validate()){
  formKey.currentState!.save();
  // final uri = Uri.https(
  // 'flutter-shopping-72fdb-default-rtdb.asia-southeast1.firebasedatabase.app',
  // 'shopping-list.json',

  // http.post(
  //   uri,
  //   headers: {
  //     'content-Type': 'application/json'
  //   },
  //   body: json.encode({
  //     "name": entertedName, 
  //     "quantity": entertedQty, 
  //     "foodCategory": selectedCategory.title,
  //   }),
     

  
  Navigator.of(context).pop(
    HouseItem(
      id: DateTime.now().toString(), 
    name: entertedName, 
    quantity: entertedQty, 
    houseCategory: selectedCategory,
    ),
  );
}
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:StyledText('Add Inventory Item', 25, Colors.white),
      ),
    body: Stack(
        children: [
          const GradientContainer(
            Color.fromARGB(255, 116, 11, 111),
            Color.fromARGB(255, 207, 157, 197),
          ),
        Padding(
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
                        child: DropdownButtonFormField<HouseCategories>(
                          value: selectedCategory,
                          items: [
                            for (final entry in houseCategories.entries)
                              DropdownMenuItem<HouseCategories>(
                                value: entry.key,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      color: entry.value.color,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(entry.value.title),
                                  ],
                                ),
                              ),
                          ],
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              selectedCategory = value;
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
                child: Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: saveItem, 
                  child: Text('Add Inventory'),
                  ),
             ],
            ),
          ],
        ),
        ),
      ),
       ],
      ),
    );
  }

}