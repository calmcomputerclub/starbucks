import 'package:flutter/material.dart';
import 'package:starbucks/ui/bottom_nav.dart';

const Color activeColor = Color.fromARGB(255, 116, 215, 119);
const Color inactiveColor = Color.fromARGB(255, 185, 185, 185);

class NavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  const NavItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.index});

  @override
  Widget build(BuildContext context) {
    // Get context from InheritedWidget
    final selectedIndex = SelectedIndex.of(context).selectedIndex;
    final selected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        SelectedIndex.of(context).updateIndex(index);
      },
      child: Column(children: [
        Icon(
          icon,
          color: selected ? activeColor : inactiveColor,
        ),
        Text(
          label,
          style: TextStyle(color: selected ? activeColor : inactiveColor),
        ),
      ]),
    );
  }
}
