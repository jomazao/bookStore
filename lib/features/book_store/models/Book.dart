class Book {
  String title;
  String subTitle;
  String authors;
  String publisher;
  String language;
  String isbn10;
  String isbn13;
  int pages;
  int year;
  int rating;
  String desc;
  String price;
  String image;
  String url;

  Book(
      {this.title,
      this.subTitle,
      this.authors,
      this.publisher,
      this.language,
      this.isbn10,
      this.isbn13,
      this.pages,
      this.year,
      this.rating,
      this.desc,
      this.image,
      this.price,
      this.url});


  Book.fromJson(Map json){

    this.title=json['title'];
    this.subTitle=json['subTitle'];
    this.authors=json['authors'];
    this.publisher=json['publisher'];
    this.language=json['language'];
    this.isbn10=json['isbn10'];
    this.isbn13=json['isbn13'];
    this.pages=json['pages'];
    this.year=json['year'];
    this.rating=json['rating'];
    this.desc=json['desc'];
    this.image=json['image'];
    this.price=json['price'];
    this.url=json['url']  ;

  }


  Map<String, dynamic> toJson() =>
      {"title" : title,
        "subTitle" : subTitle,
        "authors" : authors,
        "publisher" : publisher,
        "language" : language,
        "isbn10" : isbn10,
        "isbn13" : isbn13,
        "pages" : pages,
        "year" : year,
        "rating" : rating,
        "desc" : desc,
        "image" : image,
        "price" : price,
        "url" : url

      };
}


