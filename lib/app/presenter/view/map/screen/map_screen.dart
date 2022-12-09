// ignore_for_file: unused_field

import 'package:desafio_apirest/app/presenter/globals_widgets/circular_progress_widget.dart';
import 'package:desafio_apirest/app/presenter/view/map/controllers_map/map_controller.dart';
import 'package:desafio_apirest/app/presenter/view/map/controllers_map/map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final controllerMap = GetIt.I.get<MapController>();
  late GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    controllerMap.getLocation();
  }

  _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MapController, MapState>(
        bloc: controllerMap,
        builder: (context, state) {
          if (state is MapLoading) {
            return CircularProgressWidget(
              color: Colors.red,
            );
          }

          if (state is MapError) {
            return Center(
              child: Text(state.erro),
            );
          }

          if (state is MapSucess) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Localização'),
                backgroundColor: Colors.red,
              ),
              body: GoogleMap(
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    state.lat,
                    state.lon,
                  ),
                  zoom: 20,
                ),
                onMapCreated: _onMapCreated,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
