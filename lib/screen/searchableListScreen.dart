import 'package:flutter/material.dart';
import 'package:mmmk_app/screen/screenTemplate.dart';

import '../model/interfaces/searchable.dart';

typedef ListItemBuilder = Widget Function(Searchable data);

class SearchableListScreen extends StatefulWidget {
  final String title;
  final List<Searchable> list;
  final ListItemBuilder listItemBuilder;
  final Function onRefresh;

  SearchableListScreen({
    @required this.title,
    @required this.list,
    @required this.listItemBuilder,
    this.onRefresh,
  });

  @override
  _SearchableListScreenState createState() => _SearchableListScreenState();
}

class _SearchableListScreenState extends State<SearchableListScreen> {
  String _searchedText = "";
  List<Searchable> _filteredList;
  bool _isSearching = false;

  @override
  void initState() {
    _filteredList = widget.list;
    super.initState();
  }

  void _setFilteredList() {
    _searchedText.isEmpty
        ? setState(() => _filteredList = widget.list)
        : setState(() => _filteredList = widget.list
            .where((element) => element.contains(_searchedText))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    _setFilteredList();

    return ScreenTemplate(
      title: widget.title,
      appBar: _isSearching
          ? AppBar(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: "Keresés"),
                  textInputAction: TextInputAction.search,
                  onChanged: (value) => setState(() => _searchedText = value),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => setState(() {
                    _searchedText = "";
                    _isSearching = false;
                  }),
                ),
              ],
            )
          : null,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => setState(() => _isSearching = true),
        ),
      ],
      showDrawer: !_isSearching,
      body: RefreshIndicator(
        onRefresh: () async => widget.onRefresh(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: _filteredList.length,
            itemBuilder: (context, index) =>
                widget.listItemBuilder(_filteredList[index]),
          ),
        ),
      ),
    );
  }
}
