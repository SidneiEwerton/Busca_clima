import 'package:busca_clima2/core/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_client.g.dart';

@riverpod 
Dio dio(Ref ref){
  final options = BaseOptions(baseUrl: ApiConstants.baseUrl, connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3) );
  return Dio(options);
}







