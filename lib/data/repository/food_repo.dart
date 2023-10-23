import 'package:get/get.dart';
import 'package:parsley/data/api/api_client.dart';


class FoodRepo extends GetxService{
  final ApiClient apiClient;
  FoodRepo({required this.apiClient});





  Future<dynamic> getBreakfastList(String apiSearch,int number) async{
    return await apiClient.getData("search?q=&app_id=2fc1700b&app_key=e1ab934c57229bc8c58caaddcb5c0ab8&from=${number-1}&to=${number}&mealType=Breakfast"+apiSearch);
  }
  Future<dynamic> getDinnerList(String apiSearch,int number) async{
    return await apiClient.getData("search?q=&app_id=2fc1700b&app_key=e1ab934c57229bc8c58caaddcb5c0ab8&from=${number-1}&to=${number}&mealType=Dinner"+apiSearch);
  }
  Future<dynamic> getSnackList(String apiSearch,int number) async{
    return await apiClient.getData("search?q=&app_id=2fc1700b&app_key=e1ab934c57229bc8c58caaddcb5c0ab8&from=${number-1}&to=${number}&mealType=Snack"+apiSearch);
  }
  Future<dynamic> getTeatimeList(String apiSearch,int number) async{
    return await apiClient.getData("search?q=&app_id=2fc1700b&app_key=e1ab934c57229bc8c58caaddcb5c0ab8&from=${number-1}&to=${number}&mealType=Teatime"+apiSearch);
  }
}