import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:decor_app/core/widget/custom_svg_icon_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

BottomNavigationBar buildBottomNavBar(int selectedIndex,Function(int)? onItemTapped) {
    return BottomNavigationBar(
        backgroundColor: AppColor.whiteColor,
        selectedItemColor: AppColor.iconColor,
        unselectedItemColor: AppColor.primaryColor,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: CustomSvgIConBottomNavBar(selectedIndex: selectedIndex, image: AppImages.homeICon, indexNum: 0,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgIConBottomNavBar(selectedIndex: selectedIndex, image: AppImages.categoriesIcon, indexNum: 1,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgIConBottomNavBar(selectedIndex: selectedIndex, image: AppImages.iconCart, indexNum: 2,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgIConBottomNavBar(
              selectedIndex: selectedIndex,
              image: AppImages.wishlistIconIcon, indexNum: 3,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgIConBottomNavBar(
              selectedIndex: selectedIndex,
              image:AppImages.profileIcon, indexNum: 4,
            ),
            label: '',
          ),
        ],
      );
  }