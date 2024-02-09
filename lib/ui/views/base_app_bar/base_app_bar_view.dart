import 'package:flutter/material.dart';
import 'package:observable_flutter/app/app.locator.dart';
import 'package:observable_flutter/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'base_app_bar_viewmodel.dart';

class BaseAppBarView extends StackedView<BaseAppBarViewModel>
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const BaseAppBarView(this.title, this.actions, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BaseAppBarViewModel viewModel,
    Widget? child,
  ) {
    return AppBar(
      title: Text(title),
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => viewModel.goBack(),
            )
          : null,
      actions: actions ??
          [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                viewModel.logout();
              },
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  BaseAppBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BaseAppBarViewModel();
}
