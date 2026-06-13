

Resumo Detalhado da Fase 1 - Eliminar as violações que comprometem arquitetura e testabilidade - *** FEITO ***

  O que é Clean Architecture e por que isso importa?

  Imagine um prédio com andares bem definidos: o andar de baixo (Domain/Core) não conhece o andar de cima (Presentation). Mas antes dessas correções, o projeto tinha partes do andar de baixo "olhando para cima" — ou seja, código de negócio dependendo de código de tela. Isso cria fragilidade: se você muda a tela, pode quebrar o negócio.

  ---
  1.1 — DailyForecast movido para domain/models e convertido para @freezed

  Problema: A classe DailyForecast (que representa os dados de previsão de cada dia) estava em presentation/screans/widgets/daily_forecast.dart. Ela é um modelo de dados puros de negócio — não tem nada de visual. O WeatherModel (domínio) e o weather_repository_impl.dart (dados) tinham que importar de presentation pra usar essa classe. A dependência estava de cabeça pra baixo.

    - criei o arquivo  lib/features/weather/domain/models/daily_forecast.dart com @freezed e removi o arquivo antigo de presentation/widgets/.
    - rodei o:  dart run build_runner build para gerar o arquivo daily_forecast.freezed.dart.

  ANTES (errado):          DEPOIS (correto):
  domain ──► presentation  presentation ──► domain ◄── data

  ---
  1.2 — MultipleCitiesFailure adicionado em core/errors/failure.dart

  Problema: Quando o usuário busca por "São Paulo" e a API retorna 5 cidades com esse nome, o sistema precisa perguntar "qual São Paulo você quer?". 

  Solução:
  - Criado MultipleCitiesFailure que herda de Failure (o tipo de erro correto do projeto) e carrega a lista de cidades dentro de si.

  class MultipleCitiesFailure extends Failure {
    final List<GeocodingModel> cities;
    const MultipleCitiesFailure(this.cities) : super('Múltiplas cidades encontradas');
  }

  Agora qualquer parte do código pode fazer if (error is MultipleCitiesFailure) e acessar error.cities.
  ---
  1.3 — WeatherNotifier sem Exception genérico

  Problema: O projeto já tinha um sistema completo de erros tipados (CityNotFoundException, ServerFailure, NetworkFailure, etc.) em core/errors/failure.dart. Mas o WeatherNotifier ignorava esse sistema e usava throw Exception('...') genérico.

  padronização FEITA.


  ---
  1.4 — weather_home_scream.dart limpo (Dio + ref.read mortos removidos).

  Problema 1 — Dio no widget: Havia uma instância de Dio criada dentro do método _onSearchPressed() da tela. Ela nunca era usada (nenhuma variável a recebia).
  Era um objeto HTTP sendo criado e descartado em cada busca, dentro da camada de UI — violação direta do princípio de responsabilidade única.

  Problema 2 — ref.read inútil: Na mesma função, ref.read(geocodingRepositoryProvider) lia o provider mas não fazia nada com o resultado. Era código morto.

  SOLUÇÃO:  Removi as duas linhas. O método _onSearchPressed agora faz exatamente o que deve: validar o formulário e chamar
  weatherNotifier.search(city).

  Problema 3 — detecção de erro por tipo errado: O listener de erros verificava if (error is List<GeocodingModel>). Após a correção, verifica if (error is MultipleCitiesFailure) e acessa error.cities — correto e tipado.


  ---
  1.5 — URLs hardcoded movidas para ApiConstants

  Problema: A URL 'https://api.openweathermap.org/geo/1.0/direct' e o número 5 (limite de cidades) estavam escritos diretamente dentro do GeocodingRepositoryImpl. Se a API mudar de versão, você teria que caçar esse texto em vários lugares. Valores mágicos são inimigos da manutenibilidade.

  correção:
  - Adicionado em ApiConstants:
  static const String geoBaseUrl = 'https://api.openweathermap.org/geo/1.0/';
  static const int geocodingLimit = 5;
  - O repository agora usa '${ApiConstants.geoBaseUrl}direct' e ApiConstants.geocodingLimit.

  ---
*** RESUMO DA FASE 1 - O QUE FOI FEITO ***

  - Movi DailyForecast de presentation/widgets para domain/models e converte para @freezed
  - Adicionei MultipleCitiesFailure em core/errors, substituindo o hack de throw locations
  - Removi Exception genérico do WeatherNotifier; usa Failure tipada em todos os throws
  - Removi instância de Dio e ref.read sem uso de weather_home_scream.dart
  - Atualizei listener de erro para checar MultipleCitiesFailure ao invés de List<GeocodingModel>
  - Adicionei geoBaseUrl e geocodingLimit em ApiConstants; remove hardcode do GeocodingRepositoryImpl


  ========================================================================================================================

  *** FASE 2 ***

  AINDA EM VERIFICAÇÃO DE NOVAS MELHORIAS


  