import 'package:openfoodfacts/interface/Parameter.dart';

/// Tag filter ("LIST contains/without ITEM") search API parameter
///
/// Eg. 'nutrition_grades' contains 'A'
class TagFilter extends Parameter {
  // actually not used
  @override
  String getName() => '';

  /// Tag type (e.g. 'nutrition_grades')
  String getTagType() => tagType;

  /// "Contains - Yes/No?" parameter string
  String getContains() => contains ? 'contains' : 'without';

  /// Tag value (e.g. 'A')
  String getTagName() => tagName;

  // actually not used
  @override
  String getValue() => '';

  final String tagType;
  final bool contains;
  final String tagName;

  const TagFilter({
    required this.tagType,
    required this.contains,
    required this.tagName,
  });
}
