<<<<<<< HEAD


import 'package:busca_clima2/core/storage/preferences_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier{
  @override
  Future<ThemeMode> build() async{
    return ref.read(preferencesServiceProvider).getTheme();
   }

   Future<void> setTheme(ThemeMode mode) async{
    state = AsyncData(mode);
    await ref.read(preferencesServiceProvider).saveTheme(mode);
   }
  
=======


import 'package:busca_clima2/core/storage/preferences_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier{
  @override
  Future<ThemeMode> build() async{
    return ref.read(preferencesServiceProvider).getTheme();
   }

   Future<void> setTheme(ThemeMode mode) async{
    state = AsyncData(mode);
    await ref.read(preferencesServiceProvider).saveTheme(mode);
   }
  
>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
}