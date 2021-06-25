defmodule WabanexWeb.GraphQL.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Logic representation of Exercise"
  object :exercise do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :repetitions, non_null(:string)
    field :protocol_description, non_null(:string)
  end

  input_object :create_exercise_input do
    field :name, non_null(:string), description: "User name"
    field :repetitions, non_null(:string), description: "Number of Repetitions of the exercise"
    field :protocol_description, non_null(:string), description: "A description of the exercise"

    field :youtube_video_url, non_null(:string),
      description: "A video of the exercise from youtube"
  end
end
