import 'package:get/state_manager.dart';

class TextExpansionController extends GetxController{
var isExpanded = false.obs;
void toggleExpansion(){
  
     isExpanded.value = !isExpanded.value;
 }
}