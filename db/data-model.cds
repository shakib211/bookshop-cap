namespace my.bookshop;

using {
  Country,
  managed,
  Language,
  Currency,
  cuid
} from '@sap/cds/common';

entity Books {
  key ID       : Integer;
      title    : localized String(111);
      descr    : localized String(1111);
      author   : Association to Authors;
      genre    : String;
      stock    : Integer;
      price    : Decimal;
      currency : Currency;
      brewery  : Association to one Brewery;
}

entity Authors {
  key ID    : Integer;
      name  : localized String;
      books : Association to many Books
                on books.author = $self;
}

entity Orders : managed {
  key ID      : UUID;
      book    : Association to Books;
      country : Country;
      amount  : Integer;
}

entity Brewery : cuid, managed {
  name  : String(150);
  beers : Composition of many Books
            on beers.brewery = $self;
}

entity BreweryTest {
      name : String(150);
  key ID   : Integer;
}
