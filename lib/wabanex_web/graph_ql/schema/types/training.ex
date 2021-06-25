defmodule WabanexWeb.GraphQL.Schema.Types.Training do
  use Absinthe.Schema.Notation

  @desc "Logic representation of Training"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:date)
    field :end_date, non_null(:date)
    field :exercises, non_null(list_of(non_null(:exercise)))
  end

  input_object :create_training_input do
    field :start_date, non_null(:date)
    field :user_id, non_null(:uuid4)
    field :end_date, non_null(:date)
    field :exercises, non_null(list_of(non_null(:create_exercise_input)))
  end
end
