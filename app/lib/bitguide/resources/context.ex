defmodule Bitguide.Resources.Context do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contexts" do
    field :url, :string
    field :content, :string
    field :collection_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(context, attrs) do
    context
    |> cast(attrs, [:url, :content])
    |> validate_required([:url, :content])
  end
end
