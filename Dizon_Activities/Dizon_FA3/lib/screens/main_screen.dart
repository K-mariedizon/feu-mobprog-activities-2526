import 'package:expense_app/items/cart_item.dart';
import 'package:expense_app/items/menu_item.dart';
import 'package:expense_app/screens/item_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/checkout_screen.dart';


class MainScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const MainScreen({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<MenuItemModel> _menu = List.unmodifiable([
    MenuItemModel(id: 'm1', name: 'Burger', price: 120.0, category: 'Food', icon: Icons.fastfood),
    MenuItemModel(id: 'm2', name: 'Pizza', price: 220.0, category: 'Food', icon: Icons.local_pizza),
    MenuItemModel(id: 'm3', name: 'Pasta', price: 160.0, category: 'Food', icon: Icons.ramen_dining),
    MenuItemModel(id: 'm4', name: 'Coffee', price: 45.0, category: 'Drinks', icon: Icons.coffee),
    MenuItemModel(id: 'm5', name: 'Juice', price: 80.0, category: 'Drinks', icon: Icons.local_drink),
    MenuItemModel(id: 'm6', name: 'Water', price: 30.0, category: 'Drinks', icon: Icons.water),
    MenuItemModel(id: 'm7', name: 'Fries', price: 70.0, category: 'Sides', icon: Icons.restaurant),
    MenuItemModel(id: 'm8', name: 'Salad', price: 90.0, category: 'Sides', icon: Icons.emoji_food_beverage),
    MenuItemModel(id: 'm9', name: 'Dessert', price: 150.0, category: 'Sides', icon: Icons.icecream),
  ]);

  final List<CartItem> _cart = [];

  void _openItem(MenuItemModel m) {
    showItemModal(context, m, _cart, () => setState(() {}));
  }

  double get grandTotal => _cart.fold(0.0, (p, c) => p + c.total);

  void _Checkout() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => CheckoutScreen(cart: _cart, onClear: () => setState(() {}))));
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final cross = mq.orientation == Orientation.portrait ? 3 : 5;

    return Scaffold(
      appBar: AppBar(
        title: Text('McJo - POS', style: GoogleFonts.pacifico( color: const Color.fromARGB(255, 235, 26, 85), fontSize: 30,),),
        actions: [
          IconButton(onPressed: widget.onToggleTheme, icon: const Icon(Icons.brightness_6))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cross,
                mainAxisExtent: 140,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _menu.length,
              itemBuilder: (ctx, idx) {
                final m = _menu[idx];
                return InkWell(
                  onTap: () => _openItem(m),
                  child: Card(
                    color: Color(0xFFF6C0CF),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(child: Icon(m.icon, size: 48, color: const Color(0xFFEB1A55),)),
                          Text(m.name, style: Theme.of(context).textTheme.titleMedium),
                          Text('₱ ${m.price.toStringAsFixed(0)}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Color(0xFFF6C0CF), 
            child: Row(
              children: [
                Expanded(
                    child: Text('Total: ₱ ${grandTotal.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge)),
                ElevatedButton(
                    onPressed: _cart.isEmpty ? null : _Checkout,
                     style: ElevatedButton.styleFrom(
                     foregroundColor: const Color(0xFFEB1A55),
                   ),
                    child: const Text('Checkout'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
