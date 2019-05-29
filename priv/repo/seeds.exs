# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BooksApi.Repo.insert!(%BooksApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
BooksApi.Repo.insert! %BooksApi.Accounts.User{
  id: 1,
  username: "admin",
  password: BooksApi.Accounts.hash_password("admin")
}
BooksApi.Repo.insert! %BooksApi.Accounts.Method{
  user_id: 1,
  method: "create"
}
BooksApi.Repo.insert! %BooksApi.Accounts.Method{
  user_id: 1,
  method: "update"
}
BooksApi.Repo.insert! %BooksApi.Accounts.Method{
  user_id: 1,
  method: "delete"
}
BooksApi.Repo.insert! %BooksApi.Accounts.Method{
  user_id: 1,
  method: "show"
}
BooksApi.Repo.insert! %BooksApi.Books.Author{
  id: 1,
  firstname: "some",
  lastname: "dude"
}
BooksApi.Repo.insert! %BooksApi.Books.Book{
  id: 1,
  name: "a book",
  description: "some description",
  author_id: 1
}
