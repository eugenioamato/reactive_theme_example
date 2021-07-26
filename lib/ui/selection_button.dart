import 'package:flutter/material.dart';

class PinnedButton extends StatelessWidget {
  final String text;
  final Function() callBack;
  final IconData icon;
  final double maxWidth;
  final bool isActive;
  const PinnedButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.maxWidth,
    required this.isActive,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.tightFor(width: maxWidth),
        child: Flex(direction: Axis.horizontal, mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(
            flex: 20,
            child: ElevatedButton(
              child: Flex(direction: Axis.horizontal, mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 1,
                  child: Icon(icon),
                )
              ]),
              onPressed: callBack,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          isActive
              ? Flexible(
                  flex: 2,
                  child: Icon(
                    Icons.done,
                    color: Colors.green,
                  ))
              : Flexible(
                  flex: 2,
                  child: Icon(
                    Icons.filter_none,
                    color: Colors.transparent,
                  ),
                ),
        ]),
      ),
    );
  }
}
