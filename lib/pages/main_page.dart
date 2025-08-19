import 'package:flutter/material.dart';
import 'package:pg_hostel/pages/bookings_page.dart';
import 'package:pg_hostel/pages/profile_page.dart';


import '../utils/custom_colors.dart';
import 'package:get/get.dart';

import '../utils/statefullwrapper.dart';
import 'favourites_page.dart';
import 'home_page.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final productViewModel = Get.put(ProductViewModel());
  int _selectedIndex = 0;
  var _selectedPageIndex = 0;
  // final authViewModel = Get.put(AuthViewModel());
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;
    _pages = [
      const HomePage(),
      const BookingsPage(),
      const FavouritesPage(),
      const ProfilePage(),
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: ()  {

        },
        child: SafeArea(top: true,child:
        PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.white,
        selectedItemColor: CustomColors.primary,
        unselectedItemColor: CustomColors.secondary,
        unselectedIconTheme: IconThemeData(
          color: CustomColors.secondary,
        ),
        selectedIconTheme: IconThemeData(
          color: CustomColors.primary,
        ),
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: 'Inter',
            color: CustomColors.primary),
        unselectedLabelStyle:  TextStyle(
            color: CustomColors.white,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                _selectedIndex == 0 ? 'assets/images/home_1.png' : 'assets/images/home.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 0
                    ? CustomColors.primary
                    : CustomColors.secondary,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                _selectedIndex == 1 ? 'assets/images/booking_1.png' : 'assets/images/booking.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 1
                    ? CustomColors.primary
                    : CustomColors.secondary,
              ),
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                _selectedIndex == 2 ?  'assets/images/favourite_1.png' : 'assets/images/favourite.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 2
                    ? CustomColors.primary
                    : CustomColors.secondary,
              ),
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                _selectedIndex == 3 ?  'assets/images/profile_1.png' : 'assets/images/profile.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 3
                    ? CustomColors.primary
                    : CustomColors.secondary,
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
