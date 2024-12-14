import 'package:flutter/material.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage({
    super.key,
    required this.voteAverage,
  });

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    final stars = voteAverage / 2;

    return Row(
      children: List.generate(5, (index) {
        final filled = stars - index;
        return Stack(
          children: [
            const Icon(
              Icons.star_border,
              color: Colors.yellow,
              size: 14,
            ),
            ClipRect(
              clipper: _StarClipper(filled),
              child: const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 14,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fill;

  _StarClipper(this.fill);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * fill.clamp(0.0, 1.0), size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return oldClipper.fill != fill;
  }
}
