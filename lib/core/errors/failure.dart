abstract class Failure implements Exception {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
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
