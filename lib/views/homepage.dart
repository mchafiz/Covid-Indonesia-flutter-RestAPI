import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:restfulapi_fluttergetx/controllers/CovidController.dart';
import 'package:restfulapi_fluttergetx/views/covid_list.dart';

class HomePage extends StatelessWidget {
  final CovidController covidController = Get.put(CovidController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Kawal Pandemi Covid',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Obx(() {
                if (covidController.covidIndonesia.value.isEmpty)
                  return Center(child: CircularProgressIndicator());
                else
                  return Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              covidController.covidIndonesia.value[0].name
                                  .toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.apply(
                                      fontFamily: 'avenir',
                                      color: Colors.black,
                                      fontWeightDelta: 20),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Warga Yang Sembuh :' +
                                    covidController
                                        .covidIndonesia.value[0].sembuh,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.apply(
                                        fontFamily: 'avenir',
                                        color: Colors.red),
                              ),
                              Text(
                                'Warga Yang Positif :' +
                                    covidController
                                        .covidIndonesia.value[0].positif,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.apply(color: Colors.red),
                              ),
                              Text(
                                'Warga Yang Meninggal :' +
                                    covidController
                                        .covidIndonesia.value[0].meninggal,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.apply(color: Colors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 2,
              child: Obx(() {
                if (covidController.covidIndonesia.value.isEmpty)
                  return Center(child: CircularProgressIndicator());
                else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: covidController.covidProvinsi.value.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return CovidTile(
                          covidController.covidProvinsi.value[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              }),
            )
          ],
        ),
      ),
    );
  }
}
