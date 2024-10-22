import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/assets/app_vector.dart';
import '../bloc/dashboard_cubit.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<DashboardCubit>().state is DashboardTabChanged
          ? (context.read<DashboardCubit>().state as DashboardTabChanged).index
          : 0,
      onTap: (int index) {
        context.read<DashboardCubit>().changeTab(index);
      },
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildBottomNavigationBarItem(
          icon: SvgPicture.asset(AppVectors.iconHome),
          label: 'Home',
          isSelected: context.watch<DashboardCubit>().state is DashboardTabChanged &&
              (context.read<DashboardCubit>().state as DashboardTabChanged).index == 0,
        ),
        _buildBottomNavigationBarItem(
          icon: SvgPicture.asset(AppVectors.iconDiscovery),
          label: 'Discovery',
          isSelected: context.watch<DashboardCubit>().state is DashboardTabChanged &&
              (context.read<DashboardCubit>().state as DashboardTabChanged).index == 1,
        ),
        _buildBottomNavigationBarItem(
          icon: SvgPicture.asset(AppVectors.iconFavorite),
          label: 'Favorite',
          isSelected: context.watch<DashboardCubit>().state is DashboardTabChanged &&
              (context.read<DashboardCubit>().state as DashboardTabChanged).index == 2,
        ),
        _buildBottomNavigationBarItem(
          icon: SvgPicture.asset(AppVectors.iconAccount),
          label: 'Account',
          isSelected: context.watch<DashboardCubit>().state is DashboardTabChanged &&
              (context.read<DashboardCubit>().state as DashboardTabChanged).index == 3,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required Widget icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          icon,
          if (isSelected)
            Positioned(
              top: -5,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                color: AppColors.primary, // Màu vệt xanh
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
