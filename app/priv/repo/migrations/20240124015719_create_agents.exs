defmodule Bitguide.Repo.Migrations.CreateAgents do
  use Ecto.Migration

  def change do
    create table(:agents) do
      add :name, :string
      add :prompt, :text
      add :model, :string

      timestamps(type: :utc_datetime)
    end
  end
end
