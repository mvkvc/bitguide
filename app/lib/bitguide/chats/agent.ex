defmodule Bitguide.Chats.Agent do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bitguide.Accounts.User
  alias Bitguide.Resources.Collection

  schema "agents" do
    field :name, :string
    field :prompt, :string
    field :model, Ecto.Enum, values: [:gpt4]

    belongs_to :user, User
    has_many :collections, Collection

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(agent, attrs) do
    agent
    |> cast(attrs, [:name, :prompt, :model])
    |> validate_required([:name, :prompt, :model])
  end
end
