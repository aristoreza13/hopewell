import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hopewell/common/values/app_colors.dart';
import 'package:hopewell/pages/search/bloc/search_bloc.dart';
import 'package:hopewell/pages/search/search_controller.dart';
import 'package:hopewell/pages/search/widgets/search_widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchControllers searchC;

  @override
  void initState() {
    super.initState();
    searchC = SearchControllers(context: context);
    searchC.init();
    //trigger event after init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: SlidingUpPanel(
        color: AppColors.mojito,
        panel: BlocBuilder<SearchBloc, SearchStates>(
          builder: (context, state) {
            if (state is SearchLoadingState) {
              return CircularProgressIndicator();
            } else {
              return Column(
                children: [
                  buildHeaderSearch(context),
                  buildListTherapist(context, state.doctorList),
                ],
              );
            }
          },
        ),
        body: FlutterMap(
          options: const MapOptions(
            // initialCenter: LatLng(
            //     searchC.location['latitude'], searchC.location['longitude']),
            initialZoom: 17.0,
            // keepAlive: true,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            const Center(child: Icon(Icons.location_on_rounded)),
          ],
        ),
      ),
    );
  }
}
