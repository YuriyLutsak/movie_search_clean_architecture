import 'package:flutter/material.dart';

class StarButton extends StatelessWidget {
  const StarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      onPressed: () {},
    );
  }
}
