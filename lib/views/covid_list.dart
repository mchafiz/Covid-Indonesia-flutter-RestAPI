import 'package:flutter/material.dart';

import 'package:restfulapi_fluttergetx/models/covid_provinsi.dart';

class CovidTile extends StatelessWidget {
  final CovidProvinsi provinsi;
  const CovidTile(this.provinsi);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              provinsi.attributes.provinsi,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.apply(fontWeightDelta: 20, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(
              "Kasus Positif : " +
                  provinsi.attributes.kasusPosi.toString() +
                  ' Jiwa',
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.apply(fontWeightDelta: 20, color: Colors.red),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Kasus Sembuh : " +
                  provinsi.attributes.kasusSemb.toString() +
                  ' Jiwa',
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.apply(fontWeightDelta: 20, color: Colors.red),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Kasus Meninggal : " +
                  provinsi.attributes.kasusMeni.toString() +
                  ' Jiwa',
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.apply(fontWeightDelta: 20, color: Colors.red),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
