defmodule Bitguide.Resources.Collection do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bitguide.Accounts.User
  alias Bitguide.Resources.Context

  schema "collections" do
    field :name, :string
    field :urls, {:array, :string}

    belongs_to :user, User
    has_many :contexts, Context

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:name, :urls])
    |> validate_required([:name, :urls])
  end
end
