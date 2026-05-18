import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/EntertainmentCubit/entertainment_cubit.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/widgets/category/category_view_body.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EntertainmentCubit(ApiService()),
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kprimaryColor,
              title: Text('Destinations', style: textStyleSize25),
              actions: [
                Icon(
                  FontAwesomeIcons.mapLocationDot,
                  color: kprimaryColor5,
                  size: 30,
                ),
              ],
              centerTitle: true,
            ),
            body: Container(color: kprimaryColor, child: CategoryViewBody()),
          ),
        ),
      ),
    );
  }
}
