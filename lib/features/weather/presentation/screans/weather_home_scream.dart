import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/core/errors/failure.dart';
import 'package:busca_clima2/features/weather/presentation/providers/weather_notifier.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/aurora_halo.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/current_weather_card.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/hourly_display.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/weather_error_view.dart';
import 'package:busca_clima2/shared/widgets/app_drawer.dart';
import 'package:busca_clima2/shared/widgets/custom_snackbar.dart';
import 'package:busca_clima2/shared/widgets/loading_overlay.dart';
import 'package:busca_clima2/shared/widgets/weather_app_bar.dart';
import 'package:busca_clima2/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:busca_clima2/shared/widgets/city_disabiguation_sheet.dart';

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  ConsumerState<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
  final _cityEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cityEC.dispose();
    super.dispose();
  }

  void _onSearchPressed() {
    if (!_formKey.currentState!.validate()) return;

    final city = _cityEC.text.trim();
    if (city.isNotEmpty) {
      ref.read(weatherProvider.notifier).search(city);
      FocusScope.of(context).unfocus();
    }
  }

  void _onRetry() {
    FocusScope.of(context).unfocus();
    final city = _cityEC.text.trim();
    if (city.isEmpty) {
      ref.read(weatherProvider.notifier).search(AppStrings.defaultSearchCity);
      return;
    }
    ref.read(weatherProvider.notifier).search(city);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<WeatherModel>>(weatherProvider, (prev, next) {
      next.whenOrNull(
        error: (error, stack) {
          if (error is MultipleCitiesFailure) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (modalContext) => CityDisabiguationSheet(
                cities: error.cities,
                onSelect: (selectedCity) {
                  ref
                      .read(weatherProvider.notifier)
                      .selectLocation(selectedCity);
                },
              ),
            );
          } else {
            CustomSnackbar.show(context, error.toString());
          }
        },
      );
    });

    final weatherState = ref.watch(weatherProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      drawer: const AppDrawer(),
      appBar: const WeatherAppBar(),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -80,
            child: AuroraHalo(
              size: 380,
              color: AppColors.auroraBlue,
              alpha: 55,
            ),
          ),
          Positioned(
            top: 200,
            right: -90,
            child: AuroraHalo(
              size: 300,
              color: AppColors.auroraViolet,
              alpha: 45,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: AuroraHalo(size: 220, color: AppColors.accent, alpha: 28),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  Form(
                    key: _formKey,
                    child: CustomTextFormField(
                      controller: _cityEC,
                      labelText: AppStrings.searchLabel,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (_) => _onSearchPressed(),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.searchEmptyError;
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search, color: AppColors.accent),
                        onPressed: _onSearchPressed,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: weatherState.when(
                              data: (weather) {
                                try {
                                  return Column(
                                    children: [
                                      CurrentWeatherCard(weather: weather),
                                      
                                    ],
                                  );
                                } catch (e) {
                                  return Center(
                                    child: Text(
                                      AppStrings.weatherCardRenderError,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red.shade300,
                                      ),
                                    ),
                                  );
                                }
                              },
                              

                              loading: () => const SizedBox(
                                height: 200,
                                child: Center(child: LoadingOverlay()),
                              ),

                              error: (err, stack) {
                                if (err is MultipleCitiesFailure) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const CircularProgressIndicator(
                                            color: AppColors.accent,
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            AppStrings
                                                .multipleCitiesSelectBelow,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white.withValues(
                                                alpha: 0.8,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return WeatherErrorView(
                                  error: err,
                                  onRetry: _onRetry,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
