import 'package:get_it/get_it.dart';

import '../Services/api_client.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiClient>(ApiClient());
}
