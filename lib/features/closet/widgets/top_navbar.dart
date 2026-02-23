import 'package:flutter/material.dart';
import 'package:flutter_extension/features/closet/widgets/nav_tab.dart';

class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(4),
        child: const Row(
          children: [
            NavTab(
              label: 'My Items',
              icon: Icons.checkroom_outlined,
              active: true,
            ),
            NavTab(
              label: 'Templates',
              icon: Icons.layers_outlined,
              active: false,
            ),
            NavTab(
              label: 'My Lists',
              icon: Icons.list_alt_outlined,
              active: false,
            ),
          ],
        ),
      ),
    );
  }
}
