import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static final instance = LocationHelper();

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('LOCATION_SERVICE_ERROR');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('LOCATION_PERMISSION_DENIED');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('LOCATION_PERMISSION_DENIED');
    }
    return await Geolocator.getCurrentPosition();
  }
}
