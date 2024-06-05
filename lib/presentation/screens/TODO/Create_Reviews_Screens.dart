import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Review_Screen.dart';


class CreateReview extends StatefulWidget {
  const CreateReview({super.key});

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  final TextEditingController _fastnamete = TextEditingController();
  final TextEditingController _lastnamete = TextEditingController();
  final TextEditingController _writereviewte = TextEditingController();
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
                Get.to(() => const ReviewsScreen());
              },
            ),
            const Text('Create Reviews'),
            const SizedBox(
                width: 8), // Add some spacing between the text and the button
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
                      hintText: 'Fast Name'
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastnamete,

                  decoration: const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _writereviewte,

                  maxLines: 8,
                  decoration: const InputDecoration(
                      hintText: 'write Review'
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                   Get.to(() => const ReviewsScreen());

                  },
                  child: const Text('Next'),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _writereviewte.dispose();
    _lastnamete.dispose();
    _fastnamete.dispose();
  }
}