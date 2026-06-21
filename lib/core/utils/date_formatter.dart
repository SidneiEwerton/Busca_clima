import 'package:busca_clima2/core/constants/app_strings.dart';

extension DateFormatExtension on DateTime {
  String get diaSemanaAbreviado {
    switch (weekday) {
      case DateTime.monday:
        return AppStrings.weekdayMon;
      case DateTime.tuesday:
        return AppStrings.weekdayTue;
      case DateTime.wednesday:
        return AppStrings.weekdayWed;
      case DateTime.thursday:
        return AppStrings.weekdayThu;
      case DateTime.friday:
        return AppStrings.weekdayFri;
      case DateTime.saturday:
        return AppStrings.weekdaySat;
      case DateTime.sunday:
        return AppStrings.weekdaySun;
      default:
        return '';
    }
  }
}
