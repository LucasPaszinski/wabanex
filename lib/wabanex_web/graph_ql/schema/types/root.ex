defmodule WabanexWeb.GraphQL.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.GraphQL.Resolvers.User, as: UserResolver
  alias WabanexWeb.GraphQL.Resolvers.Training, as: TrainingResolver
  alias Crudry.Middlewares.TranslateErrors

  import_types WabanexWeb.GraphQL.Schema.Types.{User, Training, Exercise}
  import_types Absinthe.Type.Custom
  import_types WabanexWeb.GraphQL.Schema.Types.Custom.UUID4

  object :root_query do
    field :users, type: list_of(:user) do
      resolve &UserResolver.index/2
    end

    field :user, type: :user do
      arg(:id, non_null(:uuid4))

      resolve &UserResolver.get/2
    end

    field :trainings, type: list_of(:training) do
      resolve &TrainingResolver.index/2
    end
  end

  object :root_mutation do
    field :create_user_input, :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
      middleware TranslateErrors
    end

    field :create_training_input, :training do
      arg :input, non_null(:create_training_input)

      resolve &TrainingResolver.create/2
      middleware TranslateErrors
    end
  end
end
