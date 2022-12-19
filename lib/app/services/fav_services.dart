import 'package:coba/app/services/db_service.dart';
import 'package:coba/app/utils/app_utils.dart';

class FavService {
  static List favItem = [];

  static loadFav() {
    logSys('mengambil data favorite');
    favItem.addAll(mainStorage.get('favorites') ?? []);
  }

  static saveToLocalStorage() async {
    await mainStorage.put('favorites', favItem);
  }

  static Future<List> getFavList() async {
    return mainStorage.get('favorites') ?? [];
  }

  static addFav({required String title, required String imageUrl}) {
    favItem.add({
      'title': title,
      'image_url': imageUrl,
    });
    saveToLocalStorage();
  }

  static removeFav(String title) {
    favItem.removeWhere((favitem) => favitem['title'] == title);
    saveToLocalStorage();
  }

  static removeAll() async {
    await mainStorage.clear();
    saveToLocalStorage();
  }
}
