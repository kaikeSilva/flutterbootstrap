import 'package:flutter/material.dart';
import 'package:observable_flutter/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Center(
            // Wrap Column with Center for horizontal centering
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center children vertically
              children: <Widget>[
                TextFormField(
                  controller: usernameController,
                  focusNode: usernameFocusNode,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                const SizedBox(height: 20), // Add some space between the fields
                TextFormField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20), // Add some space before the button
                ElevatedButton(
                  onPressed: () {
                    viewModel.login();
                  },
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }
}
