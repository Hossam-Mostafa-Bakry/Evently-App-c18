import 'package:evently_app/core/config/routes/pages_route_name.dart';
import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:evently_app/core/gen/assets.gen.dart';
import 'package:evently_app/modules/layout/favorite/favorite_view.dart';
import 'package:evently_app/modules/layout/home/home_view.dart';
import 'package:evently_app/modules/layout/profile/profile_view.dart';
import 'package:flutter/material.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomeView(), FavoriteView(), ProfileView()];
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, PagesRouteName.createEvent);
        },
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Assets.icons.homeIcn.svg(),
            activeIcon: Assets.icons.homeActiveIcn.svg(),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Assets.icons.heartIcn.svg(),
            activeIcon: Assets.icons.heartActiveIcn.svg(),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Assets.icons.userIcn.svg(),
            activeIcon: Assets.icons.userActiveIcn.svg(),
          ),
        ],
      ),
    );
  }
}
