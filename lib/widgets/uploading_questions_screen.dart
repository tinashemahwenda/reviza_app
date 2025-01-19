import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'go_back_button.dart';

class UploadingQuestionsScreen extends StatelessWidget {
  final String uploadType;
  const UploadingQuestionsScreen({super.key, required this.uploadType});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/animations/loading.json', width: 200),
          SizedBox(height: 20),
          Text(
            'Still uploading $uploadType',
            style: TextStyle(
              fontFamily: 'Manrope-Extrabold',
              fontSize: 20,
            ),
          ),
          GoBackButton()
        ],
      ),
    );
  }
}
