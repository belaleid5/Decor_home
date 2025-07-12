import 'package:decor_app/core/network/dio_client.dart';
import 'package:decor_app/core/services/secure_storage_helper.dart';
import 'package:decor_app/core/usecase/get_product.dart';
import 'package:decor_app/features/mobile/auth/data/data_sources/auth_data_source.dart';
import 'package:decor_app/features/mobile/auth/data/data_sources/auth_local_data_source.dart';
import 'package:decor_app/features/mobile/auth/data/repositories_impl/auth_repo_imp.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';
import 'package:decor_app/features/mobile/auth/domain/use_cases/create_user_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/use_cases/login_user_usecase.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_cubit.dart';
import 'package:decor_app/features/mobile/home/data/data_sources/remote_home_data_source.dart';
import 'package:decor_app/features/mobile/home/data/repositories_impl/home_repository_imp.dart';
import 'package:decor_app/features/mobile/home/domain/repositories/base_home_repository.dart';
import 'package:decor_app/features/mobile/home/domain/use_cases/categoris_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/use_cases/get_bestseller_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/use_cases/slider_usecase.dart';
import 'package:decor_app/features/mobile/home/presentation/blocs/home_cubit.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/base_remote_data_source/base_api_setting_remote_data_source.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/base_remote_data_source/base_search_remote_data_source.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/remote_data_source_impl/api_setting_remote_data_source_impl.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/remote_data_source_impl/search_remote_data_source_impl.dart';
import 'package:decor_app/features/mobile/search/data/repositories/api_setting_repo_impl.dart';
import 'package:decor_app/features/mobile/search/data/repositories/search_repo_impl.dart';
import 'package:decor_app/features/mobile/search/domain/repositories/base_api_setting_repo.dart';
import 'package:decor_app/features/mobile/search/domain/repositories/base_search_repo.dart';
import 'package:decor_app/features/mobile/search/domain/use_cases/api_setting_use_case.dart';
import 'package:decor_app/features/mobile/search/domain/use_cases/search_use_case.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';






final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // ✅ Flutter Secure Storage
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
// ✅ Dio
sl.registerLazySingleton<Dio>(() => Dio());

  // ✅ SecureStorageHelper (بيعتمد على FlutterSecureStorage)
  sl.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());

  // ✅ Local Data Source - لازم يتسجل قبل DioClient
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl( secureStorage:sl(), ));

  // ✅ DioClient (بيعتمد على local data source)
  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));

  // ✅ Auth Remote Data Source (بيعتمد على DioClient)
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());

  // ✅ Auth Repository (بيعتمد على remote + local)
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));

  // ✅ Auth UseCases
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));


  // ✅ Home Data Source
  sl.registerLazySingleton<BaseHomeRemoteDataSource>(() => RemoteHomeRemoteDataSource());

  // ✅ Home Repository
  sl.registerLazySingleton<BaseHomeRepository>(
          () => HomeRepositoryImp(baseHomeRemoteDataSource: sl()));

  // ✅ Home Use Cases
  sl.registerLazySingleton<GetSliderUseCase>(() => GetSliderUseCase(baseHomeRepository: sl()));
  sl.registerLazySingleton<ProductUsecase>(() => ProductUsecase(baseHomeRepository: sl()));
  sl.registerLazySingleton<CategoriesUsecase>(() => CategoriesUsecase(sl()));
  sl.registerLazySingleton<BestSellerUsecase>(() => BestSellerUsecase(baseHomeRepository: sl()));

  // ✅ Home Cubit
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(sl(), sl(), sl(), sl()));

  // ✅ Search Data Sources
  sl.registerLazySingleton<BaseSearchRemoteDataSource>(() => SearchRemoteDataSourceImpl());
  sl.registerLazySingleton<BaseApiSettingRemoteDataSource>(() => ApiSettingRemoteDataSourceImpl());

  // ✅ Search Repos
  sl.registerLazySingleton<BaseApiSettingRepo>(() => ApiSettingRepoImpl(apiSettingRemoteDataSource: sl()));
  sl.registerLazySingleton<BaseSearchRepo>(() => SearchRepoImpl(sl<Dio>(), searchRemoteDataSource: sl()));

  // ✅ Search Use Cases
  sl.registerLazySingleton<SearchUseCase>(() => SearchUseCase(searchRepo: sl()));
  sl.registerLazySingleton<ApiSettingUseCase>(() => ApiSettingUseCase(apiSettingRepo: sl()));

  // ✅ Search Cubit
  sl.registerLazySingleton<SearchCubit>(() => SearchCubit(
    searchUseCase: sl(),
    apiSettingUseCase: sl(),
  ));
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl(),signUpUseCase: sl(), loginUseCase: sl()));

}
