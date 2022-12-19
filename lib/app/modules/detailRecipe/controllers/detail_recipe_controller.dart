import 'package:coba/app/data/model/recipe_model.dart';
import 'package:coba/app/services/api_services.dart';
import 'package:coba/app/utils/app_utils.dart';
import 'package:get/get.dart';

class DetailRecipeController extends GetxController {
  RxString key = ''.obs;
  Rx<RecipeModel> recipe = RecipeModel().obs;
  RxBool isLoadRecipe = true.obs;

  @override
  void onInit() {
    key.value = Get.arguments;
    logSys(key.value);
    getDetailRecipe();
    super.onInit();
  }

  getDetailRecipe() async {
    isLoadRecipe(true);
    final r = await ApiService()
        .request(url: 'recipe/${key.value}', method: Method.GET);
    recipe.value = RecipeModel.fromJson(r);
    isLoadRecipe(false);
  }
}
