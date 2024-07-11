import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie_app/presentation/constants.dart';
import 'package:recipie_app/presentation/blocs/recipie/bloc/recipie_bloc.dart';
import 'package:recipie_app/presentation/pages/home/widgets/home_tab_bar_View_widget.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: size.height * 0.06,
            child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                    color: sigInPageBg,
                    borderRadius: BorderRadius.circular(15)),
                labelPadding:
                    EdgeInsets.symmetric(horizontal: size.width * 0.012),
                onTap: (index) {
                  final categories = ["Breakfast", "Lunch", "Dinner", "Quick"];
                  final selectedCategory = categories[index];
                  context
                      .read<RecipieBloc>()
                      .add(RecipieRequestEvent(query: selectedCategory));
                },
                tabs: [
                  TabBarItem(
                    title: "Breakfast",
                  ),
                  TabBarItem(
                    title: "Lunch",
                  ),
                  TabBarItem(
                    title: "Dinner",
                  ),
                  TabBarItem(
                    title: "Quickiees",
                  ),
                ]),
          ),
          SizedBox(
            height: size.height * 0.022,
          ),
          SizedBox(
            height: size.height * 0.3,
            child: const TabBarView(
              children: [
                HomeTabBarViewWidget(),
                HomeTabBarViewWidget(),
                HomeTabBarViewWidget(),
                HomeTabBarViewWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  final String title;
  TabBarItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: sigInPageBg),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
