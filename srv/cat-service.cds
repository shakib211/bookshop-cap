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

type testType: {
       name: String;
       ID: String default null;
}
  action CancelOrder(test : testType) returns testType;
}
