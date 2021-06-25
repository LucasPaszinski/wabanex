defmodule Wabanex.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_fields [:protocol_description, :youtube_video_url, :repetitions, :name]

  schema "exercises" do
    field :name, :string
    field :youtube_video_url, :string
    field :repetitions, :string
    field :protocol_description, :string

    belongs_to :training, Training

    timestamps()
  end

  def changeset(%__MODULE__{} = exercise, attrs) do
    exercise
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
