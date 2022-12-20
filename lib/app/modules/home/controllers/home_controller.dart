import 'package:coba/app/data/model/category_model.dart';
import 'package:coba/app/data/model/popular_model.dart';
import 'package:coba/app/services/api_services.dart';
import 'package:coba/app/services/fav_services.dart';
import 'package:coba/app/services/recent_services.dart';
import 'package:coba/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CategoryModel categoryModel = CategoryModel();
  List<Map<String, dynamic>> recipesCategory = [
    {
      'category': 'Dessert',
      'url': 'https://www.masakapahariini.com/resep-masakan/resep-dessert/',
      'key': 'resep-dessert'
    },
    {
      'category': 'Masakan Hari Raya',
      'url': 'https://www.masakapahariini.com/resep-masakan/masakan-hari-raya/',
      'key': 'masakan-hari-raya'
    },
    {
      'category': 'Masakan Tradisional',
      'url':
          'https://www.masakapahariini.com/resep-masakan/masakan-tradisional/',
      'key': 'masakan-tradisional'
    },
    {
      'category': 'Menu Makan Malam',
      'url': 'https://www.masakapahariini.com/resep-masakan/makan-malam/',
      'key': 'makan-malam'
    },
    {
      'category': 'Menu Makan Siang',
      'url': 'https://www.masakapahariini.com/resep-masakan/makan-siang/',
      'key': 'makan-siang'
    },
    {
      'category': 'Resep Ayam',
      'url': 'https://www.masakapahariini.com/resep-masakan/resep-ayam/',
      'key': 'resep-ayam'
    },
    {
      'category': 'Resep Daging',
      'url': 'https://www.masakapahariini.com/resep-masakan/resep-daging/',
      'key': 'resep-daging'
    },
    {
      'category': 'Resep Sayuran',
      'url': 'https://www.masakapahariini.com/resep-masakan/resep-sayuran/',
      'key': 'resep-sayuran'
    },
    {
      'category': 'Resep Seafood',
      'url': 'https://www.masakapahariini.com/resep-masakan/resep-seafood/',
      'key': 'resep-seafood'
    },
    {
      'category': 'Sarapan',
      'url': 'https://www.masakapahariini.com/resep-masakan/sarapan/',
      'key': 'sarapan'
    }
  ];

  // ! TEXT FIELD CONTROLLER
  TextEditingController textController = TextEditingController();

  //! PAGE CONTROLLER
  PageController pageController = PageController();
  RxInt indexPage = 0.obs;

  //! CATEGORY
  RxInt indexCategori = 0.obs;

  //! TRENDING NOW
  Rx<PopularModel> trendingNow = PopularModel().obs;
  RxBool isLoadTrending = true.obs;

  //! POPULAR
  Rx<PopularModel> popular = PopularModel().obs;
  RxBool isLoadPopular = true.obs;

  //! FAV ITEM
  RxList<ResultPopular> favItem = <ResultPopular>[].obs;

  //! RECENT ITEM
  RxList<ResultPopular> recentItem = <ResultPopular>[].obs;

  setPage(int index) => indexPage.value = index;

  goToPage(int index) => pageController.jumpToPage(index);

  setIndexCategory(int index) {
    indexCategori.value = index;
  }

  getTrendingNow() async {
    isLoadTrending(true);
    final h = await ApiService().request(url: 'recipes', method: Method.GET);
    trendingNow.value = PopularModel.fromJson(h);
    isLoadTrending(false);
  }

  getPopular(String key) async {
    isLoadPopular(true);
    final p = await ApiService()
        .request(url: 'category/recipes/$key', method: Method.GET);
    popular.value = PopularModel.fromJson(p);
    isLoadPopular(false);
  }

  pullToRefresh() async {
    getTrendingNow();
    getPopular(recipesCategory[indexCategori.value]['key']);
  }

  addToFav({required ResultPopular data}) {
    try {
      if (favItem.any((element) => element == data)) {
        FavService.removeFav(data.key!);
        favItem.remove(data);
      } else {
        FavService.addFav(title: data.key!, imageUrl: data.thumb!);
        favItem.insert(0, data);
      }
      logSys('item favorite : ${favItem.length}');
    } catch (e) {
      rethrow;
    }
  }

  addToRecent({required ResultPopular data}) {
    if (recentItem.any((element) => element == data)) {
      RecentService.removeRecent(data.key!);
      recentItem
        ..remove(data)
        ..insert(0, data);
    } else {
      RecentService.addRecent(title: data.key!, imageUrl: data.thumb!);
      recentItem.insert(0, data);
    }
  }

  loadDbFav() {
    favItem.clear();
    for (var i = 0; i < FavService.favItem.length; i++) {
      final item = ResultPopular(
        key: FavService.favItem[i]['title'],
        thumb: FavService.favItem[i]['image_url'],
      );
      favItem.add(item);
    }
    logSys('item favorite : ${favItem.length}');
  }

  loadDbRecent() {
    recentItem.clear();
    for (var i = 0; i < RecentService.recent.length; i++) {
      final item = ResultPopular(
        key: RecentService.recent[i]['title'],
        thumb: RecentService.recent[i]['image_url'],
      );
      recentItem.add(item);
    }
    logSys('item recent : ${recentItem.length}');
  }

  @override
  void onInit() {
    getTrendingNow();
    getPopular(recipesCategory[indexCategori.value]['key']);
    loadDbFav();
    loadDbRecent();
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();

    super.onClose();
  }
}
