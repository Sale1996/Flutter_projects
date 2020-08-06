import 'package:geolocator/geolocator.dart';

class ClimaLocation {
  double latitude;
  double longitude;

  ClimaLocation();

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
