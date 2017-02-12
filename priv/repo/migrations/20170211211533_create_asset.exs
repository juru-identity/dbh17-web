defmodule Juru.Repo.Migrations.CreateAsset do
  use Ecto.Migration

  def change do
    create table(:assets) do
      add :asset_id, :string
      add :name, :string
    end

  end
end
