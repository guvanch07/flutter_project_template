// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/utils/utils.dart';

class NotificationUtil {
  static Map<String, dynamic>? parsePayload(String? value) {
    if (value == null) return null;
    return json.decode(value);
  }
}

class NotificationTapHandler {
  static Future<void> fromMessage(RemoteMessage message) async {
    final payload = NotificationUtil.parsePayload(
      message.data['payload'] as String?,
    );
    if (payload != null) {
      await fromPayload(payload);
    }
  }

  static Future<void> fromPayload(Map<String, dynamic> data) async {
    if (data.containsKey('deeplink')) {
      DeeplinkHandler.fromString(data['deeplink']);
      return;
    }
    final payload = PushPayload.fromJson(data);
    // TODO: Handle payload
    // if (payload.type == PushType.overdue && payload.instance != null) {
    //   await NavigationUtil.doIfAuthorized(() async {
    //     await Future.delayed(const Duration(milliseconds: 1000));
    //     return switch (payload.instance) {
    //       DocInstance.invoice => () {
    //           Navigation.toInvoicesList();
    //           GoRouteClass.withoutContext!.read<InvoicesCubit>().getInvoices(
    //               filter: InvoicesFilterEntity.empty().copyWith(overdue: true));
    //         }(),
    //       DocInstance.estimate => () {
    //           Navigation.toEstimatesList();
    //           GoRouteClass.withoutContext!.read<EstimatesCubit>().getEstimates(
    //               filter: InvoicesFilterEntity.empty().copyWith(overdue: true));
    //         }(),
    //       _ => null,
    //     };
    //   });
    // } else if (payload.instance != null && payload.id != null) {
    //   await NavigationUtil.doIfAuthorized(() async {
    //     await Future.delayed(const Duration(milliseconds: 1000));
    //     return switch (payload.instance) {
    //       DocInstance.invoice => Navigation.toInvoiceDetails(payload.id!),
    //       DocInstance.estimate => Navigation.toEstimateDetails(payload.id!),
    //       DocInstance.expense => Navigation.toExpenseDetails(payload.id!),
    //       _ => null,
    //     };
    //   });
    //   return;
    // } else if (payload.type == PushType.list && payload.instance != null) {
    //   await NavigationUtil.doIfAuthorized(() async {
    //     await Future.delayed(const Duration(milliseconds: 1000));
    //     return switch (payload.instance) {
    //       DocInstance.invoice => Navigation.toInvoicesList(),
    //       DocInstance.estimate => Navigation.toEstimatesList(),
    //       DocInstance.expense => Navigation.toExpensesList(),
    //       _ => null,
    //     };
    //   });
    // }
  }
}
