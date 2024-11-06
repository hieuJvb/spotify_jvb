import 'package:expenses_tracker/presentations/dashboard/widgets/bottom_navigation_bar.dart';
import 'package:expenses_tracker/presentations/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                int index = 0;

                if (state is DashboardTabChanged) {
                  index = state.index;
                }

                return IndexedStack(
                  index: index,
                  children: [
                    HomeScreen(),
                    Container(),
                    Container(),
                    Container()
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: Container(
              child: BottomNavigationBarScreen())
      ),
    );
  }
}