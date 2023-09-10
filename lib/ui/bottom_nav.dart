import 'package:flutter/material.dart';
import 'package:starbucks/ui/nav_item.dart';

class NavItemData {
  final IconData icon;
  final String label;

  const NavItemData({required this.icon, required this.label});
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<NavItemData> items = [
    const NavItemData(icon: Icons.home, label: "Home"),
    const NavItemData(icon: Icons.payment, label: "Pay"),
    const NavItemData(icon: Icons.border_outer_rounded, label: "Order"),
    const NavItemData(icon: Icons.shop_2, label: "Shop"),
    const NavItemData(icon: Icons.devices_other, label: "Other"),
  ];

  @override
  Widget build(BuildContext context) {
    return SelectedIndex(
      selectedIndex: selectedIndex,
      updateIndex: updateIndex,
      child: SizedBox(
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            for (var i = 0; i < items.length; i++)
              NavItem(
                icon: items[i].icon,
                label: items[i].label,
                index: i,
              )
          ])),
    );
  }
}

class SelectedIndex extends InheritedWidget {
  final int selectedIndex;
  final void Function(int index) updateIndex;

  const SelectedIndex({
    super.key,
    required super.child,
    required this.selectedIndex,
    required this.updateIndex,
  });

  static SelectedIndex? maybeof(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SelectedIndex>();
  }

  static SelectedIndex of(BuildContext context) {
    final SelectedIndex? result = maybeof(context);
    // Result should never be null
    assert(result != null, 'No SelectedIndex found in context');
    return result!;
  }

  // It decides whether to make dependent widgets rebuild or not
  @override
  bool updateShouldNotify(SelectedIndex oldWidget) {
    return selectedIndex != oldWidget.selectedIndex;
  }
}
