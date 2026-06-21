

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

Resumo Detalhado da Fase 2 - Qualidade e Organização - *** FEITO em 21/06/2026 ***

  O que essa fase resolve?

  A Fase 1 eliminou as violações que quebravam a arquitetura. A Fase 2 resolve os problemas que não quebram o app, mas prejudicam a manutenção: typos no nome de diretórios, lógica de negócio escondida dentro de widget, pasta nomeada de forma enganosa, e ausência de proteção contra erros inesperados no ViewModel.

  ---
  2.1 — core/utils/date_formatter.dart criado com DateFormatExtension

  Problema (V7): A função _formatarDiaSemana(DateTime date) existia dentro do widget NextDay.
  Um widget é responsável por desenhar a tela — não por saber como formatar uma data.
  Se outro widget precisasse da mesma lógica amanhã, teria que duplicar o código.

  Solução:
  - Criado lib/core/utils/date_formatter.dart com uma extension sobre DateTime:

    extension DateFormatExtension on DateTime {
      String get diaSemanaAbreviado {
        switch (weekday) {
          case DateTime.monday:    return AppStrings.weekdayMon;
          case DateTime.tuesday:   return AppStrings.weekdayTue;
          case DateTime.wednesday: return AppStrings.weekdayWed;
          case DateTime.thursday:  return AppStrings.weekdayThu;
          case DateTime.friday:    return AppStrings.weekdayFri;
          case DateTime.saturday:  return AppStrings.weekdaySat;
          case DateTime.sunday:    return AppStrings.weekdaySun;
          default:                 return '';
        }
      }
    }

  O que mudou na prática: qualquer widget do projeto pode agora escrever day.date.diaSemanaAbreviado
  ao invés de carregar 18 linhas de switch dentro de si. A lógica vive em core/ — onde deve estar.

  ---
  2.2 — next_day.dart usando a extension (V7 fechada)

  Com a extension criada, o widget NextDay foi atualizado:
  - Removido o método privado _formatarDiaSemana (19 linhas eliminadas do widget)
  - Removido o import redundante de flutter/widgets.dart (material.dart já o inclui)
  - Adicionado import de date_formatter.dart
  - A chamada passou de _formatarDiaSemana(day.date) para day.date.diaSemanaAbreviado

  Contexto histórico: essa função havia sido criada originalmente em weather_display.dart,
  depois migrada para next_day.dart no pull de 21/06/2026 — mas continuava acoplada a um widget.
  Agora está definitivamente no lugar correto.

  ---
  2.3 — presentation/providers/ renomeado para presentation/viewmodels/

  Problema: A pasta se chamava providers/, mas os arquivos dentro dela (WeatherNotifier, SearchNotifier)
  são ViewModels — eles encapsulam estado reativo, lógica de apresentação e não conhecem widgets.
  O Riverpod Notifier cumpre exatamente o papel de ViewModel do padrão MVVM.
  O nome providers/ não comunicava isso e confundia quem lia o código pela primeira vez.

  Solução:
  - Renomeado lib/features/weather/presentation/providers/ para presentation/viewmodels/
  - Atualizado o import em weather_home_screen.dart

  O que NÃO foi tocado: features/settings/presentation/providers/ (contém ThemeNotifier do tema)
  ficou com o nome original — estava fora do escopo desta fase.

  ---
  2.4 — Typo screans/ corrigido para screens/ + weather_home_scream.dart → weather_home_screen.dart

  Problema: O diretório das telas se chamava screans/ (faltava o 'e') e o arquivo principal
  se chamava weather_home_scream.dart (scream em vez de screen). Os typos existiam desde o início
  do projeto e se espalharam: todos os imports do projeto apontavam para o caminho errado.
  No pull de 21/06/2026 foram criados novos arquivos (next_day.dart, next_day_card.dart) dentro
  do typo — o problema havia crescido.

  Solução (execução via PowerShell + atualização de imports em todos os arquivos afetados):
  - Renomeado o diretório screans/ para screens/
  - Renomeado weather_home_scream.dart para weather_home_screen.dart
  - 8 arquivos tiveram seus imports atualizados automaticamente:
      app.dart
      weather_home_screen.dart
      weather_splash_screen.dart
      current_weather_card.dart
      hourly_card.dart
      next_day_card.dart
      weatherbackground.dart
      weather_display.dart
  - Verificação final: grep por 'screans', 'scream' e 'weather/presentation/providers/'
    retornou zero resultados — nenhuma referência antiga sobreviveu.

  As classes (WeatherHomeScreen, WeatherSplashScreen) já tinham os nomes corretos —
  só o arquivo e o diretório pai estavam com typo.

  ---
  2.5 — _runProtected() adicionado ao WeatherNotifier

  Problema: Os métodos search() e selectLocation() repetiam o mesmo ciclo de vida:
    state = AsyncLoading()
    final newState = await AsyncValue.guard(...)
    if (!ref.mounted) return;
    state = newState;

  Além da repetição, qualquer exceção inesperada que não fosse uma Failure tipada
  (ex: um NullPointerException no meio do repositório) chegava bruta até a UI como
  err.toString(), vazando detalhes técnicos para a tela.

  Solução — método privado _runProtected():

    Future<void> _runProtected(Future<WeatherModel> Function() action) async {
      state = const AsyncLoading();
      final newState = await AsyncValue.guard(() async {
        try {
          return await action();
        } on Failure {
          rethrow;             // Failure tipada: propagar sem alterar
        } catch (_) {
          throw const ServerFailure();  // Erro não mapeado: virar ServerFailure
        }
      });
      if (!ref.mounted) return;
      state = newState;
    }

  Como funciona na prática:
  - Se o repositório lança CityNotFoundException → chega à UI como CityNotFoundException ✓
  - Se o repositório lança MultipleCitiesFailure → chega à UI como MultipleCitiesFailure ✓
  - Se ocorre qualquer outro erro inesperado → a UI recebe ServerFailure com mensagem amigável ✓
  - Nunca mais um stack trace técnico aparece na tela do usuário

  Os métodos search() e selectLocation() ficaram 50% menores — cada um delega para _runProtected
  e foca apenas na sua lógica de negócio.

  ---
*** RESUMO DA FASE 2 - O QUE FOI FEITO ***

  - Criado core/utils/date_formatter.dart com DateFormatExtension sobre DateTime
  - Removido _formatarDiaSemana do widget NextDay; substituído por day.date.diaSemanaAbreviado
  - Renomeado presentation/providers/ para presentation/viewmodels/ (weather feature)
  - Renomeado screans/ para screens/ e weather_home_scream.dart para weather_home_screen.dart
  - Atualizados 8 arquivos com imports corrigidos; zero referências antigas restantes
  - Adicionado _runProtected() no WeatherNotifier: centraliza loading, mounted check e
    conversão de exceções brutas em ServerFailure

  Pontuação da camada Presentation: 6/10 → 9/10
  Todas as violações V1–V8 do diagnóstico original estão agora fechadas.

  *** PRÓXIMAS FASES ***

  Fase 3 — Testes (cobertura de repository, ViewModel e use cases com mocktail)
  Fase 4 — Evolução (busca incremental, última cidade persistida, geolocalização, i18n)

  