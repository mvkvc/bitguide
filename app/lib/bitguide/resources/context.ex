defmodule Bitguide.Resources.Context do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pgvector.Ecto.Vector
  alias Bitguide.Resources.Collection

  schema "contexts" do
    field :url, :string
    field :content, :string
    field :embedding, Vector

    belongs_to :collection, Collection

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(context, attrs) do
    context
    |> cast(attrs, [:url, :content])
    |> validate_required([:url, :content])
  end
end
