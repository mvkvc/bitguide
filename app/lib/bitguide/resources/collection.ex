defmodule Bitguide.Resources.Collection do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collections" do
    field :name, :string
    field :urls, {:array, :string}
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(collection, attrs) do
    collection
    |> cast(attrs, [:name, :urls])
    |> validate_required([:name, :urls])
  end
end
