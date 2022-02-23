import 'package:flutter/material.dart';

import '../../../models/food.dart';

class DetailsDayCard extends StatefulWidget {
  final Food? food;
  const DetailsDayCard({
    Key? key,
    this.food,
  }) : super(key: key);

  @override
  _DetailsDayCardState createState() => _DetailsDayCardState();
}

class _DetailsDayCardState extends State<DetailsDayCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.2,
      height: 230,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.food!.foodDetailsClass!.imagePath!,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
