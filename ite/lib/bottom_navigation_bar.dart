import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int visit = 0;
  @override
  Widget build(BuildContext context) {
    const List<TabItem> items = [
      TabItem(
        icon: Icons.home,
        title: 'Home',
      ),
      TabItem(
        icon: Icons.search_sharp,
        title: 'Shop',
      ),
      TabItem(
        icon: Icons.favorite_border,
        title: 'Wishlist',
      ),
      TabItem(
        icon: Icons.shopping_cart_outlined,
        title: 'Cart',
      ),
      TabItem(
        icon: Icons.account_box,
        title: 'profile',
      ),
    ];
    return BottomBarDefault(
      items: items,
      backgroundColor: mycolor.mcolor,
      color: Colors.white,
      colorSelected: mycolor.lcolor,
      indexSelected: visit,
      paddingVertical: 18,
      onTap: (index) => setState(
        () {
          visit = index;
          // switch (index) {
          //   case 0:
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (_) {
          //           return StudentAppointment();
          //         },
          //       ),
          //     );
          //   case 1:
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (_) {
          //           return Appointments();
          //         },
          //       ),
          //     );
          //   case 2:
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (_) {
          //           return ShowLabs();
          //         },
          //       ),
          //     );
          // }
        },
      ),
    );
  }
}
