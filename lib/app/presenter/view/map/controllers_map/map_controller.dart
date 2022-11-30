import 'package:desafio_apirest/app/data/datasoucer/map_location_interface.dart';
import 'package:desafio_apirest/app/presenter/view/map/controllers_map/map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapController extends Cubit<MapState> {
  MapController(this.map) : super(MapInitial());

  final IMapLocation map;

  Future<void> getLocation() async {
    emit(MapLoading());

    try {
      final local = await map.positionUser();

      emit(MapSucess(local.latitude, local.longitude));
    } catch (e) {
      emit(MapError('Erro ao busca sua localização !!'));
    }
  }
}
