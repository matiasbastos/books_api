defmodule BooksApi.AccountsTest do
  use BooksApi.DataCase

  alias BooksApi.Accounts

  describe "users" do
    alias BooksApi.Accounts.User

    @valid_attrs %{password: "some password", username: "some username"}
    @update_attrs %{password: "some updated password", username: "some updated username"}
    @invalid_attrs %{password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "methods" do
    alias BooksApi.Accounts.Method

    @valid_attrs %{method: "some method"}
    @update_attrs %{method: "some updated method"}
    @invalid_attrs %{method: nil}

    def method_fixture(attrs \\ %{}) do
      {:ok, method} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_method()

      method
    end

    test "list_methods/0 returns all methods" do
      method = method_fixture()
      assert Accounts.list_methods() == [method]
    end

    test "get_method!/1 returns the method with given id" do
      method = method_fixture()
      assert Accounts.get_method!(method.id) == method
    end

    test "create_method/1 with valid data creates a method" do
      assert {:ok, %Method{} = method} = Accounts.create_method(@valid_attrs)
      assert method.method == "some method"
    end

    test "create_method/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_method(@invalid_attrs)
    end

    test "update_method/2 with valid data updates the method" do
      method = method_fixture()
      assert {:ok, %Method{} = method} = Accounts.update_method(method, @update_attrs)
      assert method.method == "some updated method"
    end

    test "update_method/2 with invalid data returns error changeset" do
      method = method_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_method(method, @invalid_attrs)
      assert method == Accounts.get_method!(method.id)
    end

    test "delete_method/1 deletes the method" do
      method = method_fixture()
      assert {:ok, %Method{}} = Accounts.delete_method(method)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_method!(method.id) end
    end

    test "change_method/1 returns a method changeset" do
      method = method_fixture()
      assert %Ecto.Changeset{} = Accounts.change_method(method)
    end
  end
end
