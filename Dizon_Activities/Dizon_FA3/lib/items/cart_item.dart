import 'menu_item.dart';

class CartItem {
  final MenuItemModel item;
  int qty;

  CartItem({required this.item, required this.qty});

  double get total => item.price * qty;
}
