import '../models/chart_categories_model.dart';
import '../common/colors.dart';
import '../calc.dart';


final List<ChartCategoriesModel> chartCategories = [
  ChartCategoriesModel(
    key: 'done',
    label: 'Done',
    color: ScaleColors.done,
    value: getValue('Done'),
  ),
  ChartCategoriesModel(
    key: 'doneRecently',
    label: 'Done Recently',
    color: ScaleColors.doneRecently,
    value: getValue('Done Recently'),
  ),
  ChartCategoriesModel(
    key: 'stillFine',
    label: 'Still Fine',
    color: ScaleColors.stillFine,
    value: getValue('Still Fine'),
  ),
  ChartCategoriesModel(
    key: 'toDoSoon',
    label: 'To Do Soon',
    color: ScaleColors.toDoSoon,
    value: getValue('To Do Soon'),
  ),
  ChartCategoriesModel(
    key: 'toDo',
    label: 'To Do',
    color: ScaleColors.toDo,
    value: getValue('To Do'),
  ),
];


// Später dann Wortlaut wie in key statt wie in label für value verwenden!!!
