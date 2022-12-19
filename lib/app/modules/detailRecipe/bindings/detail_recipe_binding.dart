import 'package:coba/app/modules/detailRecipe/controllers/detail_recipe_controller.dart';
import 'package:get/get.dart';

class DetailRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRecipeController>(
      () => DetailRecipeController(),
    );
  }
}
