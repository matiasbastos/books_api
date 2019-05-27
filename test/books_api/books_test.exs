defmodule BooksApi.BooksTest do
  use BooksApi.DataCase

  alias BooksApi.Books

  describe "authors" do
    alias BooksApi.Books.Author

    @valid_attrs %{firstname: "some firstname", lastname: "some lastname"}
    @update_attrs %{firstname: "some updated firstname", lastname: "some updated lastname"}
    @invalid_attrs %{firstname: nil, lastname: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Books.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Books.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Books.create_author(@valid_attrs)
      assert author.firstname == "some firstname"
      assert author.lastname == "some lastname"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Books.update_author(author, @update_attrs)
      assert author.firstname == "some updated firstname"
      assert author.lastname == "some updated lastname"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_author(author, @invalid_attrs)
      assert author == Books.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Books.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Books.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Books.change_author(author)
    end
  end

  describe "books" do
    alias BooksApi.Books.Book

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Books.create_book(@valid_attrs)
      assert book.description == "some description"
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Books.update_book(book, @update_attrs)
      assert book.description == "some updated description"
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
