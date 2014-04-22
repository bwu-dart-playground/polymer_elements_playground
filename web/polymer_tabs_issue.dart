library polymer_tabs_issue;

import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart' show Logger;

@CustomTag('polymer-tabs-issue')
class PolymerTabsIssueElement extends PolymerElement  {
  final _logger = new Logger('polymer-tabs-issue');

  @published
  dynamic selectedTab;

  PolymerTabsIssueElement.created(): super.created() {
    _logger.finest('created');
  }

  void selectedTabChanged(old) {
    _logger.finest(selectedTab);
    print(selectedTab);
  }

  @override
  void ready() {
    selectedTab = '1';
  }
}