defmodule Bitguide.Repo.Migrations.CreateContexts do
  use Ecto.Migration

  def change do
    create table(:contexts) do
      add :url, :string
      add :content, :text
      add :embedding, :vector, size: 1536
      add :collection_id, references(:collections, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:contexts, [:collection_id])
  end
end
