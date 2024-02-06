// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String SearchTermValueKey = 'searchTerm';
const String TesteValueKey = 'teste';

final Map<String, TextEditingController> _HomeViewTextEditingControllers = {};

final Map<String, FocusNode> _HomeViewFocusNodes = {};

final Map<String, String? Function(String?)?> _HomeViewTextValidations = {
  SearchTermValueKey: null,
  TesteValueKey: null,
};

mixin $HomeView {
  TextEditingController get searchTermController =>
      _getFormTextEditingController(SearchTermValueKey);
  TextEditingController get testeController =>
      _getFormTextEditingController(TesteValueKey);

  FocusNode get searchTermFocusNode => _getFormFocusNode(SearchTermValueKey);
  FocusNode get testeFocusNode => _getFormFocusNode(TesteValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_HomeViewTextEditingControllers.containsKey(key)) {
      return _HomeViewTextEditingControllers[key]!;
    }

    _HomeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HomeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HomeViewFocusNodes.containsKey(key)) {
      return _HomeViewFocusNodes[key]!;
    }
    _HomeViewFocusNodes[key] = FocusNode();
    return _HomeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    searchTermController.addListener(() => _updateFormData(model));
    testeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    searchTermController.addListener(() => _updateFormData(model));
    testeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          SearchTermValueKey: searchTermController.text,
          TesteValueKey: testeController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _HomeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HomeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HomeViewTextEditingControllers.clear();
    _HomeViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get searchTermValue =>
      this.formValueMap[SearchTermValueKey] as String?;
  String? get testeValue => this.formValueMap[TesteValueKey] as String?;

  set searchTermValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SearchTermValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(SearchTermValueKey)) {
      _HomeViewTextEditingControllers[SearchTermValueKey]?.text = value ?? '';
    }
  }

  set testeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TesteValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(TesteValueKey)) {
      _HomeViewTextEditingControllers[TesteValueKey]?.text = value ?? '';
    }
  }

  bool get hasSearchTerm =>
      this.formValueMap.containsKey(SearchTermValueKey) &&
      (searchTermValue?.isNotEmpty ?? false);
  bool get hasTeste =>
      this.formValueMap.containsKey(TesteValueKey) &&
      (testeValue?.isNotEmpty ?? false);

  bool get hasSearchTermValidationMessage =>
      this.fieldsValidationMessages[SearchTermValueKey]?.isNotEmpty ?? false;
  bool get hasTesteValidationMessage =>
      this.fieldsValidationMessages[TesteValueKey]?.isNotEmpty ?? false;

  String? get searchTermValidationMessage =>
      this.fieldsValidationMessages[SearchTermValueKey];
  String? get testeValidationMessage =>
      this.fieldsValidationMessages[TesteValueKey];
}

extension Methods on FormStateHelper {
  setSearchTermValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchTermValueKey] = validationMessage;
  setTesteValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TesteValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchTermValue = '';
    testeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchTermValueKey: getValidationMessage(SearchTermValueKey),
      TesteValueKey: getValidationMessage(TesteValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _HomeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _HomeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      SearchTermValueKey: getValidationMessage(SearchTermValueKey),
      TesteValueKey: getValidationMessage(TesteValueKey),
    });
