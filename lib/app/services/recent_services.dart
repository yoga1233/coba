import 'package:coba/app/services/db_service.dart';

class RecentService {
  static List recent = [];

  static loadRecent() {
    recent.addAll(mainStorage.get('recent') ?? []);
  }

  static saveToLocalStorage() async {
    await mainStorage.put('recent', recent);
  }

  static addRecent({required String title, required String imageUrl}) {
    if (recent.length == 10) {
      recent.removeLast();
    }
    recent.insert(0, {
      'title': title,
      'image_url': imageUrl,
    });
    saveToLocalStorage();
  }

  static removeRecent(String title) {
    recent.removeWhere((favitem) => favitem['title'] == title);
    saveToLocalStorage();
  }
}
