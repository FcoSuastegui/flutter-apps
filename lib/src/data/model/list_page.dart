class ListPage<ItemType> {
  ListPage({
    required this.totalCount,
    required this.itemList,
    this.message = "",
  });

  final int totalCount;
  final List<ItemType> itemList;
  final String message;

  bool isLastPage(int previouslyFetchedItemsCount) {
    final newItemsCount = itemList.length;
    final totalFetchedItemsCount = previouslyFetchedItemsCount + newItemsCount;
    return totalFetchedItemsCount == totalCount;
  }
}
