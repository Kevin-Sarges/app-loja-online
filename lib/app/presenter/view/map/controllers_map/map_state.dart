abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapSucess extends MapState {
  double lat;
  double lon;

  MapSucess(this.lat, this.lon);
}

class MapError extends MapState {
  String erro;

  MapError(this.erro);
}
