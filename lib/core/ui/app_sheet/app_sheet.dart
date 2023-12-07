import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ready_structure/core/ui/cubit/application_cubit.dart';
import 'package:ready_structure/core/constant/images_path.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import '../../app_localization/app_localization.dart';
import '../../constant/dimens.dart';
import '../../theming/colors/colors_manager.dart';
import '../widgets/images/png_image.dart';

class AppSheets {
  const AppSheets._();

  static Future<T?> showEmojiSheet<T>({
    required TextEditingController controller,
  }) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      elevation: 0.0,
      backgroundColor: AppFixedColors.transparent,
      barrierColor: AppFixedColors.black.withOpacity(0.16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(Dimens.sheetBorderRadius))),
      context: ApplicationCubit.context!,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // EmojiPickerWidget(controller: controller),
        ],
      ),
    );
  }

  static Future<T?> showDynamicHeightSheet<T>({
    required Widget child,
    BuildContext? context,
    bool withHeader = false,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      elevation: 0.0,
      backgroundColor: ColorsManager.defaultInstance.primaryColor,
      barrierColor: AppFixedColors.transparent,
      context: context ?? ApplicationCubit.context!,
      builder: (context) => _SheetDecoratorWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (withHeader) SheetHeader(),
            child,
          ],
        ),
      ),
    );
  }

  static Future<T?> showScrollableSheet<T>({
    BuildContext? context,
    required Widget child,
    bool? isScrollControlled,
    double? initialChildSize,
    double? fixedChildSize,
    bool withHeader = true,
  }) {
    return showModalBottomSheet(
        context: context ?? ApplicationCubit.context!,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimens.sheetBorderRadius))),
        isDismissible: true,
        elevation: 0.0,
        enableDrag: true,
        isScrollControlled: isScrollControlled ?? false,
        backgroundColor: Colors.transparent,
        barrierColor: AppFixedColors.black.withOpacity(0.16),
        builder: (cxt) {
          return Container(
            padding: MediaQuery.of(ApplicationCubit.context!).viewInsets,
            child: DraggableScrollableSheet(
              maxChildSize: fixedChildSize ?? 1.0,
              minChildSize: fixedChildSize ?? 0.6,
              initialChildSize: fixedChildSize ?? initialChildSize ?? 0.65,
              expand: false,
              builder: (context, scrollController) => _SheetDecoratorWidget(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (withHeader) SheetHeader(),
                    Flexible(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Future<T?> showNormalRoundedSheet<T>(
      {BuildContext? context, required Widget child}) {
    final contentPadding = EdgeInsets.zero;
    return showModalBottomSheet(
        context: context ?? ApplicationCubit.context!,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimens.sheetBorderRadius))),
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: AppFixedColors.black.withOpacity(0.16),
        elevation: 0.0,
        builder: (cxt) {
          return BackdropFilter(
            filter: Styles.blur1,
            child: Container(
              padding: contentPadding,
              decoration: BoxDecoration(
                  color: ColorsManager.instance(ApplicationCubit.context!)
                      .primaryColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child,
                ],
              ),
            ),
          );
        });
  }

  static Future<List<T>?> showMultiSelectSheet<T extends EquatableMixin>({
    BuildContext? context,
    required List<T> items,
    required List<T> selectedItems,
    required ItemBuilder<T> itemBuilder,
  }) async {
    final selectedItemsCopy = List<T>.from(selectedItems);
    return showScrollableSheet(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
              MultiSelectSheetBody<T>(
                onSelectionChange: (List<T> value) {
                  log('HTR $value');
                  selectedItemsCopy.clear();
                  selectedItemsCopy.addAll(value);
                  setState(() {});
                  log('HTR END $value');
                },
                items: items,
                selectedItems: selectedItemsCopy,
                itemBuilder: itemBuilder,
              ),
            ],
          );
        },
      ),
      isScrollControlled: true,
      withHeader: false,
    );
  }

  static Future<T?> showSelectSheet<T>({
    BuildContext? context,
    Function(T? v)? onSelect,
    required List<T> items,
    required T? selectedItems,
    Function? onCancelChoice,
    Function? onAddNewItem,
    required String title,
    String? addNewItemTitle,
    required ItemBuilder<T> itemBuilder,
  }) async {
    var selectedItemsCopy = selectedItems;
    return showScrollableSheet(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              const SheetHeader(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Styles.font14PrimaryColorWeight500(
                        fontWeight: AppFontWeight.weight_700,
                        fontSize: AppFontSize.fontSize_14,
                      ),
                    ),
                    if (selectedItems != null)
                      InkWell(
                        onTap: () {
                          if (onCancelChoice != null) {
                            onCancelChoice();
                          }
                        },
                        child: Row(
                          children: [
                            const PngImageAsset(
                              ImagesPath.close,
                              color: AppFixedColors.darkGrey2,
                              width: 8,
                              height: 8,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              AppLocalize.gen.cancel_choice,
                              style: Styles.font14PrimaryColorWeight500(
                                fontWeight: AppFontWeight.weight_400,
                                fontSize: AppFontSize.fontSize_12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (addNewItemTitle != null)
                      InkWell(
                        onTap: () {
                          if (onAddNewItem != null) {
                            onAddNewItem();
                          }
                        },
                        child: Row(
                          children: [
                            const PngImageAsset(
                              ImagesPath.add,
                              // color: AppFixedColors.darkGrey2,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              addNewItemTitle,
                              style: Styles.font14PrimaryColorWeight500(
                                fontWeight: AppFontWeight.weight_400,
                                fontSize: AppFontSize.fontSize_12,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SelectSheetBody<T>(
                onSelectionChange: (T value) {
                  log('HTR $value');
                  selectedItemsCopy = value;
                  context.pop(selectedItemsCopy);
                  if (onSelect != null) {
                    onSelect(selectedItemsCopy);
                  }
                  setState(() {});
                  log('HTR END $value');
                },
                items: items,
                selectedItems:
                    selectedItemsCopy != null ? [selectedItemsCopy!] : [],
                itemBuilder: itemBuilder,
              ),
            ],
          );
        },
      ),
      isScrollControlled: true,
      withHeader: false,
    );
  }
}

class SheetHeader extends StatelessWidget {
  final Color? color;

  const SheetHeader({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 40,
              height: 5,
              child: Row(
                children: [
                  PngImageAsset(ImagesPath.header,
                      fit: BoxFit.fill, color: color)
                ],
              )),
        ],
      ),
    );
  }
}

typedef Widget ItemBuilder<T>(BuildContext context, T item);

class MultiSelectSheetBody<@required T extends EquatableMixin>
    extends StatelessWidget {
  final ItemBuilder<T> itemBuilder;
  final List<T> items;
  final List<T> selectedItems;
  final ValueChanged<List<T>> onSelectionChange;

  final ScrollController? scrollController;

  const MultiSelectSheetBody({
    Key? key,
    required this.itemBuilder,
    required this.items,
    required this.selectedItems,
    required this.onSelectionChange,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
      controller: scrollController,
      itemBuilder: (context, index) {
        final currentItem = items[index];
        final selected = selectedItems.contains(currentItem);

        return InkWell(
          onTap: () {
            final val = !selectedItems.contains(currentItem);
            if (val == true) {
              onSelectionChange(List.from([...selectedItems, currentItem]));
            } else {
              selectedItems.remove(currentItem);
              onSelectionChange(List.from([...selectedItems]));
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppFixedColors.black,
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                  value: selected,
                  onChanged: (val) {
                    if (val == true) {
                      onSelectionChange(
                          List.from([...selectedItems, currentItem]));
                    } else {
                      selectedItems.remove(currentItem);
                      onSelectionChange(List.from([...selectedItems]));
                    }
                  }),
              itemBuilder(context, currentItem),
            ],
          ),
        );
      },
    );
  }
}

class SelectSheetBody<@required T> extends StatelessWidget {
  final ItemBuilder<T> itemBuilder;
  final List<T> items;
  final List<T> selectedItems;
  final ValueChanged<T> onSelectionChange;

  final ScrollController? scrollController;

  const SelectSheetBody({
    Key? key,
    required this.itemBuilder,
    required this.items,
    required this.selectedItems,
    required this.onSelectionChange,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
      controller: scrollController,
      itemBuilder: (context, index) {
        final currentItem = items[index];

        return InkWell(
          onTap: () {
            final val = !selectedItems.contains(currentItem);
            if (val == true) {
              onSelectionChange(currentItem);
            } else {
              selectedItems.remove(currentItem);
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              itemBuilder(context, currentItem),
            ],
          ),
        );
      },
    );
  }
}

class _SheetDecoratorWidget extends StatelessWidget {
  final Widget child;

  const _SheetDecoratorWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: Styles.blur,
      child: Container(
        decoration: BoxDecoration(
            color: ColorsManager.defaultInstance.primaryColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimens.sheetBorderRadius))),
        child: child,
      ),
    );
  }
}
