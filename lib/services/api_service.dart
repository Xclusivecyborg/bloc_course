

import 'package:dio/dio.dart';

abstract class ApiService{
  Future<Response> get({required String url});
}