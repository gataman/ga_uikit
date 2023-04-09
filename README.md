# GA UI Kit

GA UI Kit is a collection of useful widgets that can be used in Flutter. These widgets are designed to save developers time when developing applications and help them get started with their applications more quickly.

## Installation

To use GA UI Kit, you need to add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  ga_uikit:
    git:
      url: https://github.com/gataman/ga_uikit.git
      ref: "ed2f082" #opsional if you want specific commit
```

Usage
To use GA UI Kit, you can import it in your project files like this:

```dart
import 'package:ga_uikit/ga_uikit.dart';
```

Then, you can use the widget you want. For example, the GaFormDialog  widget can be used as follows:

```dart
  GaFormDialog(
    buildContent: (context) {
      return GaFormDialogContent(
        title: 'Add New Student',
        content: Container(),
        confirmButtonColor: context.primary,
        onConfirmButtonPressed: () {
         // Save student
        },
        confirmIconPosition: IconPosition.left,
        confirmButtonRoundType: RadiusType.bottom,
        confirmButtonLabel: LocaleKeys.actions_save.locale,
        loadingListener: _loadingListener,
        loadingText: 'Please wait...',
        errorListener: _errorListener,
      );
    },
  );

```

Examples
GA UI Kit comes with a few example widgets. These widgets are:

GACard: Provides a simple card view.
GABottomBar: A pre-built widget for a bottom navigation bar.
GATextField: Provides a simple text input box.
GAButton: Provides a simple button widget.


Contributing
GA UI Kit is an open-source project for Flutter developers to use and contribute. Therefore, if you want to contribute to the project, you can contribute by solving the problems in the "Issues" section on our GitHub page or by adding a new feature.

License
GA UI Kit is licensed under the MIT License. For more information, please refer to the LICENSE file.

Thanks to [@VB10](https://github.com/VB10) for the idea to extract out core widgets.

[HardwareAndro](https://www.youtube.com/watch?v=s7_YllxtWu8&list=PL1k5oWAuBhgV_XnhMSyu2YLZMZNGuD0Cv&index=27)

