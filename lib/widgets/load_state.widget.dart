import 'package:flutter/material.dart';

class LoadState extends StatelessWidget {
  final bool isVisible;

  LoadState({@required this.isVisible});

  @override
  Widget build(BuildContext context) {
      var screenWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        isVisible
            ? Container(
              width: screenWidth,
              height: 250,
              alignment: Alignment.center,
                child: Text(
                  "-",
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            : SizedBox(
                height: 20,
              ),
      ],
    );
  }
}
