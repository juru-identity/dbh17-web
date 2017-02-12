defmodule Juru.User do
  use Juru.Web, :model

  schema "users" do
    field :name, :string
    field :public_key, :string
    field :private_key, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :public_key, :private_key])
    |> validate_required([:name, :public_key, :private_key])
  end
end
