import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';

abstract class Failure implements Exception {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class MultipleCitiesFailure extends Failure {
  final List<GeocodingModel> cities;
  const MultipleCitiesFailure(this.cities) : super(AppStrings.multipleCitiesFound);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(AppStrings.networkError);
}

class CityNotFoundException extends Failure {
  const CityNotFoundException() : super(AppStrings.cityNotFoundError);
}

class ApiKeyInvalidFailure extends Failure {
  const ApiKeyInvalidFailure() : super(AppStrings.apiKeyInvalidError);
}

class ServerFailure extends Failure {
  const ServerFailure() : super(AppStrings.serverError);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super(AppStrings.timeoutError);
}
