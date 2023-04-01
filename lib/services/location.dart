import 'package:geolocator/geolocator.dart'; 
 
class Location { 
  double? latitude; 
  double? longitude; 
 
  Future<void> getCurrentLocation() async { 
    try { 
      final permission = await Geolocator.checkPermission(); 
      if (permission != LocationPermission.always ||
          permission != LocationPermission.whileInUse) { 
        await Geolocator.requestPermission(); 
      } 
      Position? position = await Geolocator.getCurrentPosition( 
          desiredAccuracy: LocationAccuracy.low); 
      if (position != null) { 
        latitude = position.latitude; 
        longitude = position.longitude; 
      } 
    } catch (e) { 
      print(e); 
    } 
  } 
} 
