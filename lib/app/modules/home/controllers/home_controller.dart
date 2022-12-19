import 'package:coba/app/data/model/category_model.dart';
import 'package:coba/app/data/model/popular_model.dart';
import 'package:coba/app/data/model/trending_model.dart';
import 'package:coba/app/services/api_services.dart';
import 'package:coba/app/services/fav_services.dart';
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

  TextEditingController textController = TextEditingController();

  PageController pageController = PageController();
  RxInt indexPage = 0.obs;

  RxInt indexCategori = 0.obs;

  Rx<TrendingNowModel> trendingNow = TrendingNowModel().obs;
  RxBool isLoadTrending = true.obs;

  Rx<PopularModel> popular = PopularModel().obs;
  RxBool isLoadPopular = true.obs;

  FocusNode inputFocusNode = FocusNode();

  RxList favItem = [].obs;

  setPage(int index) => indexPage.value = index;

  goToPage(int index) => pageController.jumpToPage(index);

  setIndexCategory(int index) {
    indexCategori.value = index;
  }

  getTrendingNow() async {
    isLoadTrending(true);
    final h = await ApiService().request(url: 'recipes', method: Method.GET);
    trendingNow.value = TrendingNowModel.fromJson(h);
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

  addToFav({required String title, required String imageUrl}) {
    try {
      if (favItem.any((element) => element['title'] == title)) {
        FavService.removeFav(title);
        favItem(FavService.favItem);
      } else {
        FavService.addFav(title: title, imageUrl: imageUrl);
        favItem(FavService.favItem);
      }
      logSys('item favorite : ${favItem.length}');
    } catch (e) {
      rethrow;
    }
  }

  clearAllFavorite() {
    FavService.removeAll();
    favItem(FavService.favItem);
    logSys('item favorite : ${favItem.length}');
  }

  containFav(String key) {
    final contain = favItem.where((element) => element['title'] == key);
    if (contain.isEmpty) {
      logSys(true.toString());
      return true;
    } else {
      logSys(false.toString());
      return false;
    }
  }

  @override
  void onInit() {
    getTrendingNow();
    getPopular(recipesCategory[indexCategori.value]['key']);

    logSys('item favorite : ${FavService.favItem.length}');
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();

    super.onClose();
  }
}
