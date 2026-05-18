import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/EntertainmentCubit/entertainment_cubit.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/HistoricalCubit/historical_cubit.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/VarietyCubit/variety_cubit.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/entertainment_trips_view.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/historical_trips_view.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/variety_trips_view.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = context.read<ApiService>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EntertainmentCubit(apiService)..getDestinationByType(),
        ),
        BlocProvider(
          create: (_) => HistoricalCubit(apiService)..getDestinationByType(),
        ),
        BlocProvider(
          create: (_) => VarietyCubit(apiService)..getDestinationByType(),
        ),
      ],
      child: Column(
        children: [
          SizedBox(height: 15),
          ButtonsTabBar(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            backgroundColor: kprimaryColor4,
            unselectedBackgroundColor: Colors.white,
            labelStyle: textStyleSize15.copyWith(color: kprimaryColor),
            unselectedLabelStyle: textStyleSize15.copyWith(
              color: kprimaryColor4,
            ),
            borderWidth: 1,
            unselectedBorderColor: kprimaryColor4,
            radius: 100,
            tabs: [
              Tab(text: 'Entertainment', icon: Icon(Icons.emoji_emotions)),
              Tab(text: 'Historical', icon: Icon(Icons.museum)),
              Tab(text: 'Variety', icon: Icon(FontAwesomeIcons.puzzlePiece)),
            ],
          ),
          SizedBox(height: 22),
          Expanded(
            child: TabBarView(
              children: [
                PrimaryScrollController.none(child: EntertainmentTripsView()),
                PrimaryScrollController.none(child: HistoricalTripsView()),
                PrimaryScrollController.none(child: VarietyTripsView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
