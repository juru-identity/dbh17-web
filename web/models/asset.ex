defmodule Juru.Asset do
  use Juru.Web, :model

  schema "assets" do
    field :asset_id, :string
    field :name, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:asset_id, :name])
    |> validate_required([:asset_id, :name])
  end
end
