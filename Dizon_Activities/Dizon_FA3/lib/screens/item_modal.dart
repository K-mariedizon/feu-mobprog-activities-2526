import 'package:expense_app/items/cart_item.dart';
import 'package:expense_app/items/menu_item.dart';
import 'package:flutter/material.dart';

void showItemModal(
    BuildContext context, MenuItemModel m, List<CartItem> cart, VoidCallback refresh) {
  int qty = 1;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return StatefulBuilder(builder: (ctx2, setState2) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx2).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(m.icon, size: 40),
                  title: Text(m.name, style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text('₱ ${m.price.toStringAsFixed(2)}'),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (qty > 1) setState2(() => qty--);
                        },
                        icon: const Icon(Icons.remove_circle)),
                    Text('$qty', style: Theme.of(context).textTheme.titleLarge),
                    IconButton(
                        onPressed: () => setState2(() => qty++),
                        icon: const Icon(Icons.add_circle)),
                    const SizedBox(width: 20),
                    Text(
                        'Total: ₱ ${(m.price * qty).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.of(ctx2).pop(),
                         style: TextButton.styleFrom(
                     foregroundColor: const Color.fromARGB(255, 81, 11, 30),
                   ),
                        child: const Text('Cancel')),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () {
                          final exist = cart.indexWhere((c) => c.item.id == m.id);
                          if (exist >= 0) {
                            cart[exist].qty += qty;
                          } else {
                            cart.add(CartItem(item: m, qty: qty));
                          }
                          refresh();
                          Navigator.of(ctx2).pop();
                        },
                        style: ElevatedButton.styleFrom(
                     foregroundColor: const Color(0xFFEB1A55),
                   ),
                        child: const Text('Add to Cart'))
                  ],
                )
              ],
            ),
          ),
        );
      });
    },
  );
}
