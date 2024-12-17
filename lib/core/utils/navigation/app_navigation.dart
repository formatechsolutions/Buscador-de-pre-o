import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';

class AppNavigation extends StatelessWidget {
  final PageController pageController;
  final int selectedIndex;
  final Function(int) onTap;

  const AppNavigation({
    super.key,
    required this.pageController,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) {
            pageController.jumpToPage(index);
            onTap(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Configurações'),
          ],
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          iconSize: 28.0,
          selectedItemColor: ColorsTheme.primary,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
