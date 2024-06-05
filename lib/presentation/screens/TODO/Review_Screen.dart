import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';
import '../product_details_screen.dart';
import 'Create_Reviews_Screens.dart';


class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.to(() =>  const ProductDetailsScreen(productId: 10));

              },
            ),
            const Text('Reviews'),
            const SizedBox(
                width: 8), // Add some spacing between the text and the button
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 6, // Number of items in the list
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Set the background color here
                      borderRadius:
                      BorderRadius.circular(12), // Add border radius
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
                                  color: Colors
                                      .white70, // Background color of the icon
                                  shape: BoxShape.circle,
                                  // Shape of the icon background
                                ),
                                child: const Icon(
                                  Icons.person_outline_sharp,
                                  color: Colors.black,
                                  size: 32,
                                  // Color of the icon itself
                                ),
                              ),
                            ),
                            const Text(
                              'Saifuddin',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                            'These are short, famous texts in English from classic sources like the Bible or Shakespeare.  ')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _countReview(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateReview());
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget _countReview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 220,
            height: 50,
            child: Text(
              'Reviews (100)',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}