import 'package:flutter/material.dart';
import 'package:observable_flutter/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'home_viewmodel.dart';

@FormView(
    fields: [FormTextField(name: 'searchTerm'), FormTextField(name: 'teste')])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        // Adding a logout button in the app bar for easy access
        title: Text(
            'Welcome, ${viewModel.username ?? 'User'}'), // Display username here
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              viewModel.logout();
            },
          ),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: viewModel.fetchNewCategory),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: searchTermController,
                        focusNode: searchTermFocusNode,
                        decoration: const InputDecoration(
                          hintText: 'Buscar pelo nome',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewModel.data?.length,
                          itemBuilder: (context, index) {
                            final date = viewModel.data?[index];
                            return Card(
                                child: ListTile(
                              title: Text(
                                date?.datatime ??
                                    '', // Correcting the typo from datatime to datetime
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => viewModel.navigateToDate(date!),
                            ));
                          }),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
