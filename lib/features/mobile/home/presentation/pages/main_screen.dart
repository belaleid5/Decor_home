import 'package:decor_app/core/functions/build_bottmo_nav_bar.dart';
import 'package:decor_app/core/services/service_locator.dart';
import 'package:decor_app/features/mobile/home/presentation/blocs/home_cubit.dart';
import 'package:decor_app/features/mobile/home/presentation/pages/home_screen.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_cubit.dart';
import 'package:decor_app/features/mobile/search/presentation/pages/filter_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const FilterSearchScreen(),
      const Center(child: Text("Cart Page")),
      const Center(child: Text("Wishlist Page")),
      const Center(child: Text("Profile Page")),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create:
              (BuildContext context) =>
                  sl<HomeCubit>()
                    ..getSlider()
                    ..getCategories()
                    ..getBestSeller()
                    ..getCollection(),
        ),
        BlocProvider<SearchCubit>(
          create:
              (BuildContext context) =>
                  sl<SearchCubit>()
                    ..fetchApiSettings()
                    ..fetchSearchData(SearchParamsEntity()),
        ),
      ],
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: buildBottomNavBar(_selectedIndex, _onItemTapped),
      ),
    );
  }
}
