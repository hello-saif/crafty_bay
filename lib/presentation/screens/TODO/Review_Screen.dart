import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/TODO/Review_Controll.dart';
import '../../utility/app_colors.dart';
import '../main_bottom_nav_bar_screen.dart';
import '../product_details_screen.dart';
import 'Create_Reviews_Screens.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewController _reviewController = Get.find<ReviewController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.to(() => const MainBottomNavBarScreen());
              },
            ),
            const Text('Reviews'),
            const SizedBox(width: 8), // Add some spacing between the text and the button
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _reviewController.reviews.length,
                itemBuilder: (context, index) {
                  final review = _reviewController.reviews[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Set the background color here
                        borderRadius: BorderRadius.circular(12), // Add border radius
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Define the action when the button is pressed
                                },
                                icon: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white70, // Background color of the icon
                                    shape: BoxShape.circle, // Shape of the icon background
                                  ),
                                  child: const Icon(
                                    Icons.person_outline_sharp,
                                    color: Colors.black,
                                    size: 32, // Color of the icon itself
                                  ),
                                ),
                              ),
                              Text(
                                '${review.firstName} ${review.lastName}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(review.reviewText),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          _countReview(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateReview());
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _countReview() {
    final ReviewController _reviewController = Get.find<ReviewController>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return SizedBox(
              width: 220,
              height: 50,
              child: Text(
                'Reviews (${_reviewController.reviews.length})',
                style: const TextStyle(fontSize: 20),
              ),
            );
          }),
        ],
      ),
    );
  }
}
