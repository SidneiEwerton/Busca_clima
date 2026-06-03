<<<<<<< HEAD
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityService({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity();

  Future<bool> hasConnection() async{
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result != ConnectivityResult.none );
  }
}

=======
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityService({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity();

  Future<bool> hasConnection() async{
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result != ConnectivityResult.none );
  }
}

>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
