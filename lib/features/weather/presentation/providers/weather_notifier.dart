
import 'package:busca_clima2/features/weather/data/repositories/weather_repository_provider.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_notifier.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  // o metodo build define o estado inicial do provider
  @override
  Future<WeatherModel> build() async{
    return _fetchWeather('Taubaté');

  }

  // o metodo privado para buscar os dados no repositorio 
  Future<WeatherModel> _fetchWeather(String cityName) async{
    // Instanciando o repositorio atraves do Ref
final repository = ref.read(weatherRepositoryProvider);
    return await repository.fetchWeather(cityName);
     }

// metodo que UI vai chamar quando o usuario fizer pesquisa 
Future<void> searchWeather(String cityName)async{
  // colocar o estado em load , enquanto a UI busca a informação 
  state = const AsyncLoading();
  
  // tenta buscar os novos dados , 
  // se der certo , coloca o resultado em AsyncData
  // se der erro , captura  a exeção e coloca dentro de AsyncErro 
  state = await AsyncValue.guard(() => _fetchWeather(cityName),);  



}

  
}

