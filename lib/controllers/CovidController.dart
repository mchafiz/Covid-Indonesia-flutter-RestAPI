import 'package:get/get.dart';
import 'package:restfulapi_fluttergetx/models/covid_Indonesia.dart';
import 'package:restfulapi_fluttergetx/models/covid_provinsi.dart';
import 'package:restfulapi_fluttergetx/services/remote_services.dart';

class CovidController extends GetxController {
  var isLoading = true.obs;
  var covidProvinsi = RxList<CovidProvinsi>().obs;
  var covidIndonesia = RxList<Covid>().obs;

  @override
  void onInit() {
    fetchCovidIndonesia();
    fetchCovidProvinsi();
    super.onInit();
  }

  void fetchCovidIndonesia() async {
    try {
      isLoading(true);
      var covidIndonesiaService = await RemoteServices.fetchCovidIndonesia();
      if (covidIndonesiaService != null) {
        covidIndonesia.value = covidIndonesiaService;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCovidProvinsi() async {
    try {
      isLoading(true);
      var covidProvinsiService = await RemoteServices.fetchCovidProvinsi();
      if (covidProvinsiService != null) {
        covidProvinsi.value = covidProvinsiService;
      }
    } finally {
      isLoading(false);
    }
  }
}
