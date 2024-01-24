defmodule Bitguide.ChatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bitguide.Chats` context.
  """

  @doc """
  Generate a agent.
  """
  def agent_fixture(attrs \\ %{}) do
    {:ok, agent} =
      attrs
      |> Enum.into(%{
        model: "some model",
        name: "some name",
        prompt: "some prompt"
      })
      |> Bitguide.Chats.create_agent()

    agent
  end
end
