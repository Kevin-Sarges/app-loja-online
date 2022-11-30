import 'package:geolocator/geolocator.dart';

abstract class IMapLocation {
  Future<Position> positionUser();
}
