defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.User
  alias Wabanex.Exercise

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_fields [:user_id, :start_date, :end_date]

  schema "trainings" do
    field :start_date, :date
    field :end_date, :date

    belongs_to :user, User

    has_many :exercises, Exercise

    timestamps()
  end

  def changeset(%__MODULE__{} = training, attrs) do
    training
    |> cast(attrs, @required_fields)
    |> cast_assoc(:exercises, required: true)
    |> validate_required(@required_fields)
    |> assoc_constraint(:user)
  end
end
