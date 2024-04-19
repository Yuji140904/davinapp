
// import 'package:davin_app/home/view/account_screen.dart';
// import 'package:davin_app/home/view/buy_screen.dart';
// import 'package:davin_app/home/view/favorite_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// import 'home_screen.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   final List tabItems = const [
//     HomeScreen,
//     Buy(),
//     Favorite(),
//     Profile(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: tabItems[_selectedIndex],
//       ),
//       bottomNavigationBar: GNav(
//         gap: 8,
//         tabs: [
//           GButton(
//             icon: Icons.home,
//             text: 'Home',
//           ),
//           GButton(
//             icon: Icons.favorite_border,
//             text: 'Like',
//           ),
//           GButton(
//             icon: Icons.add_card,
//             text: 'Buy',
//           ),
//           GButton(
//             icon: Icons.person,
//             text: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
