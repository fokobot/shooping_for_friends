import 'package:get_it/get_it.dart';

import 'services/api.dart';
import 'view_models/product_model.dart';
import 'services/products_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Api
  locator.
  registerLazySingleton(() => Api());

  // Lazy Singletones
  locator.registerLazySingleton(() => ProductService());

  // Factories
  locator.registerFactory(() => ProductModel());
}