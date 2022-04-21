import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/cubit/navbar_cubit.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/cart/cart_view.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/explore/explore_view.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/profile/profile.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/search/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EcommerceView extends StatelessWidget {
  static const String routeName = '/ecommerce-app';
  const EcommerceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const ExploreView(),
      const SearchView(),
      const CartView(),
      const ProfileView(),
    ];

    return BlocProvider(
      create: (context) => NavbarCubit(
        pageController: PageController(initialPage: 0),
      ),
      child: BlocBuilder<NavbarCubit, NavbarState>(
        builder: (context, state) {
          final cubit = context.read<NavbarCubit>();
          return Scaffold(
            body: PageView(
              onPageChanged: cubit.onItemTapped,
              physics: const NeverScrollableScrollPhysics(),
              controller: cubit.pageController,
              children: [...pages],
            ),
            bottomNavigationBar: FlashyTabBar(
              selectedIndex: state.selectedPage,
              showElevation: false,
              onItemSelected: cubit.onItemTapped,
              items: [
                FlashyTabBarItem(
                  icon: const Icon(Icons.home_outlined, size: 23),
                  title: const Text('Home'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.search, size: 23),
                  title: const Text('Search'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.shopping_bag_outlined, size: 23),
                  title: const Text('Cart'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    size: 23,
                  ),
                  title: const Text('Profile'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
