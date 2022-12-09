import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return buildSkeleton(context);
  }

  Container buildSkeleton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.lowValue),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.8),
      ),
      child: buildListTile(),
    );
  }

  Row buildListTile() {
    return Row(
      children: [
        buildLeadingBox(),
        SizedBox(width: size),
        Expanded(
          child: buildSection(),
        )
      ],
    );
  }

  Container buildLeadingBox() {
    return Container(
      width: size * 2.5,
      height: size * 2.5,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }

  Column buildSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitleBox(),
        SizedBox(
          height: size * 0.5,
        ),
        buildSubtitleBox()
      ],
    );
  }

  Container buildTitleBox() {
    return Container(
      width: double.infinity,
      height: size * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 2.5),
        color: Colors.grey,
      ),
    );
  }

  Container buildSubtitleBox() {
    return Container(
      width: size * 6,
      height: size * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 2.5),
        color: Colors.grey,
      ),
    );
  }
}
