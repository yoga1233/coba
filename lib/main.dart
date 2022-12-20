import 'package:coba/app/data/app_sessions.dart';
import 'package:coba/app/routes/app_pages.dart';
import 'package:coba/app/services/db_service.dart';
import 'package:coba/app/services/fav_services.dart';
import 'package:coba/app/services/recent_services.dart';
import 'package:coba/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await GetStorage.init();
  final path = await getTemporaryDirectory();
  Hive.init(path.path);
  mainStorage = await Hive.openBox('mainStorage');
  AppSessions.load();
  await FavService.loadFav();
  await RecentService.loadRecent();
  logSys('Favorite item : ${FavService.favItem.length}');
  logSys('Recent item : ${RecentService.recent.length}');
  logSys('isOnBoarding : ${AppSessions.isOnBoarding}');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        builder: (context, child) => MediaQuery(
          /// Setting font does not change with system font size
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        ),
        title: 'Application',
        initialRoute: AppSessions.isOnBoarding ? AppPages.INITIAL : Routes.HOME,
        getPages: AppPages.routes,
      ),
    ),
  );
}
