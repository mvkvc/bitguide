defmodule Bitguide.ChatsTest do
  use Bitguide.DataCase

  alias Bitguide.Chats

  describe "agents" do
    alias Bitguide.Chats.Agent

    import Bitguide.ChatsFixtures

    @invalid_attrs %{name: nil, prompt: nil, model: nil}

    test "list_agents/0 returns all agents" do
      agent = agent_fixture()
      assert Chats.list_agents() == [agent]
    end

    test "get_agent!/1 returns the agent with given id" do
      agent = agent_fixture()
      assert Chats.get_agent!(agent.id) == agent
    end

    test "create_agent/1 with valid data creates a agent" do
      valid_attrs = %{name: "some name", prompt: "some prompt", model: "some model"}

      assert {:ok, %Agent{} = agent} = Chats.create_agent(valid_attrs)
      assert agent.name == "some name"
      assert agent.prompt == "some prompt"
      assert agent.model == "some model"
    end

    test "create_agent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_agent(@invalid_attrs)
    end

    test "update_agent/2 with valid data updates the agent" do
      agent = agent_fixture()
      update_attrs = %{name: "some updated name", prompt: "some updated prompt", model: "some updated model"}

      assert {:ok, %Agent{} = agent} = Chats.update_agent(agent, update_attrs)
      assert agent.name == "some updated name"
      assert agent.prompt == "some updated prompt"
      assert agent.model == "some updated model"
    end

    test "update_agent/2 with invalid data returns error changeset" do
      agent = agent_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_agent(agent, @invalid_attrs)
      assert agent == Chats.get_agent!(agent.id)
    end

    test "delete_agent/1 deletes the agent" do
      agent = agent_fixture()
      assert {:ok, %Agent{}} = Chats.delete_agent(agent)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_agent!(agent.id) end
    end

    test "change_agent/1 returns a agent changeset" do
      agent = agent_fixture()
      assert %Ecto.Changeset{} = Chats.change_agent(agent)
    end
  end
end
