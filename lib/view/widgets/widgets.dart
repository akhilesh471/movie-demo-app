import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    Key? key,
    required this.size,
    required this.controller,
    required this.formkey,
  }) : super(key: key);

  final Size size;
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            // height: size.height * 0.06,
            width: size.width * 0.8,
            child: TextFormField(
              controller: controller,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Field Required';
                } else {
                  return null;
                }
              }),
              decoration: const InputDecoration(
                  border: const OutlineInputBorder(), hintText: 'Add Reviews'),
            )),
        Center(
          child: IconButton(
              onPressed: () {
             
              },
              icon: const Icon(
                Icons.send,
                size: 40,
              )),
        )
      ],
    );
  }
}

//<-----------------Ratings------------------->
class Rating extends StatefulWidget {
  Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

double? emojiRating;

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      unratedColor: Colors.white,
      itemCount: 5,
      itemSize: 30,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Icon(
              Icons.sentiment_very_dissatisfied,
              color: emojiRating == 1 ? Colors.red : Colors.white,
            );
          case 1:
            return Icon(
              Icons.sentiment_dissatisfied,
              color: emojiRating == 2 ? Colors.redAccent : Colors.white,
            );
          case 2:
            return Icon(
              Icons.sentiment_neutral,
              color: emojiRating == 3 ? Colors.amber : Colors.white,
            );
          case 3:
            return Icon(
              Icons.sentiment_satisfied,
              color: emojiRating == 4 ? Colors.lightGreenAccent : Colors.white,
            );
          case 4:
            return Icon(
              Icons.sentiment_very_satisfied,
              color: emojiRating == 5 ? Colors.green : Colors.white,
            );
          default:
            return SizedBox();
        }
      },
      onRatingUpdate: (double value) {
        setState(() {
          emojiRating = value;
        });
      },
    );
  }
}
