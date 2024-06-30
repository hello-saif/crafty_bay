import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/Review_model.dart';
import '../../state_holders/TODO/Review_Controll.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({super.key});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  final TextEditingController _fastnamete = TextEditingController();
  final TextEditingController _lastnamete = TextEditingController();
  final TextEditingController _writereviewte = TextEditingController();
  final ReviewController _reviewController = Get.put(ReviewController());

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
                Get.back();
              },
            ),
            const Text('Create Reviews'),
            const SizedBox(width: 8), // Add some spacing between the text and the button
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                  controller: _fastnamete,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastnamete,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _writereviewte,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: 'Write Review',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _reviewController.addReview(
                      Review(
                        firstName: _fastnamete.text,
                        lastName: _lastnamete.text,
                        reviewText: _writereviewte.text,
                      ),
                    );
                    Get.back();
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _writereviewte.dispose();
    _lastnamete.dispose();
    _fastnamete.dispose();
    super.dispose();
  }
}
