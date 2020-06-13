

class Item {
  String name;
  ItemType itemType;
  Rarity rarity;
}

enum Rarity {
  common,
  uncommon,
  rare,
  ultraRare,
  secretRare
}

enum ItemType {
  defaultItem,
  weapon,
  equipment
}