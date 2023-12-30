import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.showBackground = true,
    this.needSizeBox = true,
    this.bgColor = Colors.transparent,
  });

  final bool showBackground;
  final bool needSizeBox;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: showBackground
                      ? Colors.grey.withOpacity(0.05)
                      : Colors.transparent,
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
