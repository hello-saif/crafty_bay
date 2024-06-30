import 'package:get/get.dart';
import '../../../data/models/Review_model.dart';

class ReviewController extends GetxController {
  var reviews = <Review>[].obs;

  void addReview(Review review) {
    reviews.add(review);
  }
}
