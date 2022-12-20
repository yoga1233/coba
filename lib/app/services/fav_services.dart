import 'package:coba/app/services/db_service.dart';

class FavService {
  static List favItem = [];

  static loadFav() {
    favItem.addAll(mainStorage.get('favorites') ?? []);
  }

  static saveToLocalStorage() async {
    await mainStorage.put('favorites', favItem);
  }

  static addFav({required String title, required String imageUrl}) {
    favItem.insert(0, {
      'title': title,
      'image_url': imageUrl,
    });
    saveToLocalStorage();
  }

  static removeFav(String title) {
    favItem.removeWhere((favitem) => favitem['title'] == title);
    saveToLocalStorage();
  }
}
