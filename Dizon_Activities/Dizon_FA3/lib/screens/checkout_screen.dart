import 'package:expense_app/items/cart_item.dart';
import 'package:expense_app/chart/chart.dart';
import 'package:expense_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cart;
  final VoidCallback onClear;

  const CheckoutScreen({
    Key? key,
    required this.cart,
    required this.onClear,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<CartItem> get cart => widget.cart;

  double get grandTotal => cart.fold(0.0, (p, c) => p + c.total);

  Map<String, int> categoryCounts() {
    final Map<String, int> out = {};
    for (var c in cart) {
      out[c.item.category] = (out[c.item.category] ?? 0) + c.qty;
    }
    return out;
  }

  void _removeItem(int index) {
    final removedItem = cart[index];
    setState(() {
      cart.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color.fromARGB(255, 254, 154, 182),
        content: Text('Removed'),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: const Color.fromARGB(255, 136, 2, 40),
          onPressed: () {
            setState(() {
              cart.insert(index, removedItem);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counts = categoryCounts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 212, 224),
        title: Text(
          'Checkout - McJo',
          style: GoogleFonts.pacifico(
            color: const Color(0xFFEB1A55),
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          CheckoutChart(categoryCounts: counts),
          const Divider(),
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Cart is empty'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (ctx, idx) {
                      final c = cart[idx];
                      return Dismissible(
                        key: ValueKey(c.item.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: const Color.fromARGB(255, 255, 54, 64),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (dir) => _removeItem(idx),
                        child: ListTile(
                          leading: Icon(c.item.icon),
                          title: Text('${c.item.name} x${c.qty}'),
                          subtitle: Text('₱ ${c.total.toStringAsFixed(2)}'),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                     foregroundColor: const Color(0xFFEB1A55),
                   ),
                  child: const Text('Back to Menu'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    widget.cart.clear();
                    widget.onClear();
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen( onToggleTheme: () {},),),
                    (route) => false, // remove all previous routes
                    );
                  },
                  style: ElevatedButton.styleFrom(
                     foregroundColor: const Color(0xFFEB1A55),
                   ),
                  child: const Text('Logout'),
                ),
                const Spacer(),
                Text(
                  'Total: ₱ ${grandTotal.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
