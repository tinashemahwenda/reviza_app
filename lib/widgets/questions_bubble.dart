import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:reviza_app/screens/saved_questions.dart';

import 'package:reviza_app/screens/upgrade_account.dart';

import '../constants/app_constants.dart';
import '../models/question.dart';

class QuestionsBubble extends StatefulWidget {
  final String questionBody;
  final int questionNumber;
  final String questionCode;
  final String paperCode;
  final bool isSaved;
  final VoidCallback onSavePressed;

  const QuestionsBubble({
    super.key,
    required this.questionNumber,
    required this.questionBody,
    required this.questionCode,
    required this.paperCode,
    required this.isSaved,
    required this.onSavePressed,
    //required this.data,
  });

  @override
  State<QuestionsBubble> createState() => _QuestionsBubbleState();
}

class _QuestionsBubbleState extends State<QuestionsBubble> {
  bool savedButton = false;

  List images = [
    'assets/images/biology.png',
    'assets/images/ecocash-logo.png',
    'assets/images/chemistry.png',
  ];

  void toggleButton() {
    setState(() {
      if (savedButton == true) {
        savedButton = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.darkBlue,
          content: Text('Question ${widget.questionNumber} removed'),
          action: SnackBarAction(
            label: 'View',
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SavedQuestions(
                          allQuestions: [],
                        ))),
          ),
        ));
      } else {
        savedButton = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.darkBlue,
          content: Text('Question ${widget.questionNumber} saved successfully'),
          action: SnackBarAction(
            label: 'View',
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SavedQuestions(
                          allQuestions: [],
                        ))),
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(20),
          width: AppMeasure.width,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${widget.questionNumber.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope-Extrabold',
                      fontSize: AppText.smallText,
                    ),
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: AppColor.darkBlue,
                          child: Text(
                            '${widget.paperCode}${widget.questionCode}',
                            style: TextStyle(
                              fontSize: 8,
                              fontFamily: 'Manrope-Extrabold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedQuestions(
                                      allQuestions: [],
                                    ))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: AppColor.darkBlue,
                            child: Text(
                              'Solution',
                              style: TextStyle(
                                fontSize: 8,
                                fontFamily: 'Manrope-Extrabold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          //padding: EdgeInsets.all(0),
                          onTap: widget.onSavePressed,
                          child: Icon(
                              widget.isSaved
                                  ? Icons.bookmark
                                  : Icons.bookmark_add_outlined,
                              color: AppColor.darkBlue)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: AppMeasure.height / 4,
                width: AppMeasure.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.contain,
                    );
                  },
                  loop: false,
                  itemCount: images.length,
                  control: SwiperControl(
                    size: 18,
                    padding: EdgeInsets.all(10),
                    color: AppColor.darkBlue,
                    disableColor: AppColor.backgroundColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SelectableText(
                  widget.questionBody,
                  style: TextStyle(
                    height: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
