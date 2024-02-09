import 'package:flutter/material.dart';
import 'package:observable_flutter/models/date.dart';
import 'package:observable_flutter/ui/views/base_app_bar/base_app_bar_view.dart';
import 'package:stacked/stacked.dart';

import 'date_details_viewmodel.dart';

class DateDetailsView extends StackedView<DateDetailsViewModel> {
  final Date date;
  const DateDetailsView({Key? key, required this.date}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DateDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: BaseAppBarView(date.datatime ?? "Detalhes", null),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Text(
            date.datatime ?? 'NO_DESCCRIPTION',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  DateDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DateDetailsViewModel();
}
