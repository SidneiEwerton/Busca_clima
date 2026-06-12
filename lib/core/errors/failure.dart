import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';

abstract class Failure implements Exception {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class MultipleCitiesFailure extends Failure {
  final List<GeocodingModel> cities;
  const MultipleCitiesFailure(this.cities) : super('Múltiplas cidades encontradas');
}

class NetworkFailure extends Failure {
  const NetworkFailure()
    : super('Falha na conexão com a internet. Verifique a conexão');
}

class CityNotFoundException extends Failure {
  const CityNotFoundException()
    : super('Cidade não encontrada. Verifique o nome ');
}

class ApiKeyInvalidFailure extends Failure {
  const ApiKeyInvalidFailure()
    : super('Falha na autenticação com a API. Contate o suporte');
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Erro no servidor. Tente mais tarde');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure()
    : super('Conexão lenta. Verifique sua internet e tente novamente.');
}
