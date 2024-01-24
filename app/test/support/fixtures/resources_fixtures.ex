defmodule Bitguide.ResourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bitguide.Resources` context.
  """

  @doc """
  Generate a collection.
  """
  def collection_fixture(attrs \\ %{}) do
    {:ok, collection} =
      attrs
      |> Enum.into(%{
        name: "some name",
        urls: ["option1", "option2"]
      })
      |> Bitguide.Resources.create_collection()

    collection
  end
end
