
import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/system_ui_overlay_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/notification/widget/notification_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsView extends ConsumerStatefulWidget {
  const NotificationsView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationsViewState();

}

class _NotificationsViewState extends ConsumerState<NotificationsView>{
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: MainAppBar(
        leadingWidget: const BackButtonWidget(),
        title: LangEnum.notifications.tr(),
      ),
      body: ListView.separated(
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        padding: (10, 30).toSymmetric,
        separatorBuilder: (context, index) => 15.ph,
        itemBuilder: (context, index) {
          return const NotificationCell();
        },
      ),
    ).systemUiDarkText(context);
  }

}

