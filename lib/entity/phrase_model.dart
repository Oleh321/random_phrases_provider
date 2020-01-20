class PhraseModel {
  String quote;
  String author;

  PhraseModel(this.quote, this.author);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["quote"] = this.quote;
    data["author"] = this.author;
    return data;
  }

  PhraseModel.fromJson(Map<String, dynamic> json) {
    quote = json["quote"];
    author = json["author"];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PhraseModel &&
              runtimeType == other.runtimeType &&
              quote == other.quote &&
              author == other.author;

  @override
  int get hashCode => quote.hashCode ^ author.hashCode;

  @override
  String toString() {
    return 'PhraseModel{quote: $quote, author: $author}';
  }
}