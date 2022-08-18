import 'package:cash_vic/app/models/contest.dart';
import 'package:cash_vic/app/services/ApiService.dart';
import 'package:cash_vic/app/widgets/data_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OffersController extends GetxController {
  final show = false.obs;
  final apiService = Get.find<ApiService>();
  Contest? contest;
  RxList<EventsBean> events = RxList<EventsBean>();
  RxBool isDoneBefore = false.obs;

  final list = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  putContest(Contest data) {
    this.contest = data;
    this.events.clear();
    if (contest!.events == null) {
      return;
    }
    for (var item in contest!.events!) {
      this.events.add(item);
      list.add(false);
    }
  }

  void start(int index) async {
    launchUrl(Uri.parse(contest!.url));
    await apiService.apiManager
        .updateTrackList(userId: userID(), offerId: contest!.offerid);
    show.value = !show.value;
    list[index] = !list[index];
  }

  showStartButton(int index) async {
    if (await apiService.fetchTrackList(
        userId: userID(), offerId: contest!.offerid)) {
      Get.showSnackbar(GetSnackBar(
        message: 'You have already participated in this offer',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
      return;
    }
    show.value = !show.value;
    list[index] = !list[index];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
