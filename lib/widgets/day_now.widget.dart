import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DayNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // inicializa o formato de date/hr 
    const locale = "pt_BR";
    initializeDateFormatting(locale).then((_) {});

    final dateNow = new DateFormat.EEEE(locale).format(new DateTime.now());

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Observer(
                builder: (_) => Text(
                  dateNow,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 15.0),
              child: Text(
                "HOJE",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Divider(
          color: Theme.of(context).accentColor,
        )
      ],
    );
  }
}
