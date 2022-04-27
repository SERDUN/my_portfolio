import 'package:flutter/material.dart';

import '../../../../../domain/entity/model/user/portfolio_skills_model.dart';
import 'tree_node.dart';
import 'tree_root.dart';

class TreeView extends StatelessWidget {
  final List<PortfolioSkillsModel> data;

  final double offsetLeft;

  final TextStyle subCategoryTextStyle;
  final TextStyle categoryTextStyle;

  const TreeView({
    Key? key,
    required this.data,
    this.offsetLeft = 24.0,
    required this.subCategoryTextStyle,
    required this.categoryTextStyle,
  }) : super(key: key);

  List<TreeNode> _geneTreeNodes(List list) {
    List treeNodes = <TreeNode>[];

    for (int i = 0; i < list.length; i++) {
      final PortfolioSkillsModel item = list[i];
      final title = Text(
        item.title,
        style: subCategoryTextStyle,
        softWrap: true,
      );

      treeNodes.add(TreeNode(
        title: title,
        expanded: item.expanded,
        offsetLeft: offsetLeft,
        children: _geneTreeNodes(item.children),
      ));
    }

    return treeNodes as List<TreeNode>;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(data.length, (int index) {
        final PortfolioSkillsModel item = data[index];
        final title = MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              item.title,
              style: categoryTextStyle,
            ));

        return TreeRoot(
          title: title,
          expanded: item.expanded,
          offsetLeft: offsetLeft,
          children: _geneTreeNodes(item.children),
        );
      }),
    );
  }
}
