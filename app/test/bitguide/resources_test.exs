defmodule Bitguide.ResourcesTest do
  use Bitguide.DataCase

  alias Bitguide.Resources

  describe "collections" do
    alias Bitguide.Resources.Collection

    import Bitguide.ResourcesFixtures

    @invalid_attrs %{name: nil, urls: nil}

    test "list_collections/0 returns all collections" do
      collection = collection_fixture()
      assert Resources.list_collections() == [collection]
    end

    test "get_collection!/1 returns the collection with given id" do
      collection = collection_fixture()
      assert Resources.get_collection!(collection.id) == collection
    end

    test "create_collection/1 with valid data creates a collection" do
      valid_attrs = %{name: "some name", urls: ["option1", "option2"]}

      assert {:ok, %Collection{} = collection} = Resources.create_collection(valid_attrs)
      assert collection.name == "some name"
      assert collection.urls == ["option1", "option2"]
    end

    test "create_collection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_collection(@invalid_attrs)
    end

    test "update_collection/2 with valid data updates the collection" do
      collection = collection_fixture()
      update_attrs = %{name: "some updated name", urls: ["option1"]}

      assert {:ok, %Collection{} = collection} = Resources.update_collection(collection, update_attrs)
      assert collection.name == "some updated name"
      assert collection.urls == ["option1"]
    end

    test "update_collection/2 with invalid data returns error changeset" do
      collection = collection_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_collection(collection, @invalid_attrs)
      assert collection == Resources.get_collection!(collection.id)
    end

    test "delete_collection/1 deletes the collection" do
      collection = collection_fixture()
      assert {:ok, %Collection{}} = Resources.delete_collection(collection)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_collection!(collection.id) end
    end

    test "change_collection/1 returns a collection changeset" do
      collection = collection_fixture()
      assert %Ecto.Changeset{} = Resources.change_collection(collection)
    end
  end

  describe "contexts" do
    alias Bitguide.Resources.Context

    import Bitguide.ResourcesFixtures

    @invalid_attrs %{url: nil, content: nil}

    test "list_contexts/0 returns all contexts" do
      context = context_fixture()
      assert Resources.list_contexts() == [context]
    end

    test "get_context!/1 returns the context with given id" do
      context = context_fixture()
      assert Resources.get_context!(context.id) == context
    end

    test "create_context/1 with valid data creates a context" do
      valid_attrs = %{url: "some url", content: "some content"}

      assert {:ok, %Context{} = context} = Resources.create_context(valid_attrs)
      assert context.url == "some url"
      assert context.content == "some content"
    end

    test "create_context/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resources.create_context(@invalid_attrs)
    end

    test "update_context/2 with valid data updates the context" do
      context = context_fixture()
      update_attrs = %{url: "some updated url", content: "some updated content"}

      assert {:ok, %Context{} = context} = Resources.update_context(context, update_attrs)
      assert context.url == "some updated url"
      assert context.content == "some updated content"
    end

    test "update_context/2 with invalid data returns error changeset" do
      context = context_fixture()
      assert {:error, %Ecto.Changeset{}} = Resources.update_context(context, @invalid_attrs)
      assert context == Resources.get_context!(context.id)
    end

    test "delete_context/1 deletes the context" do
      context = context_fixture()
      assert {:ok, %Context{}} = Resources.delete_context(context)
      assert_raise Ecto.NoResultsError, fn -> Resources.get_context!(context.id) end
    end

    test "change_context/1 returns a context changeset" do
      context = context_fixture()
      assert %Ecto.Changeset{} = Resources.change_context(context)
    end
  end
end
