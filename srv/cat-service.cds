using my.bookshop as my from '../db/data-model';
using my.bookshop.BreweryTest as breweryTest from '../db/data-model';

service CatalogService {
  entity Books @readonly         as projection on my.Books;
  entity Books_texts @readonly   as projection on my.Books.texts;
  entity Authors @readonly       as projection on my.Authors;
  entity Authors_texts @readonly as projection on my.Authors.texts;
  entity Orders                  as projection on my.Orders;
  entity Brewery                 as projection on my.Brewery;
  entity BreweryTest             as projection on breweryTest;
  
  entity BookReviews as SELECT from Books mixin{ 
  book_text: Association to Books_texts on book_text.ID = ID and book_text.locale = $user.locale;
  authors : Association to Authors on authors.ID = author.ID;
  breweries: Association to Brewery on breweries.ID = brewery.ID;
}into {
  *,
  authors.name as authorName,
  breweries.name as breweriesName,
  book_text.title as localeTitle
};

type testType: {
       name: String;
       ID: String default null;
}
  action CancelOrder(test : testType) returns testType;
}
