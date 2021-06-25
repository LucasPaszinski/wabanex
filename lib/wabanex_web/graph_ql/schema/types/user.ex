defmodule WabanexWeb.GraphQL.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(non_null(:training))
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "User Full Name"
    field :email, non_null(:string), description: "User Email"
    field :password, non_null(:string), description: "User Password (more than 6 caracters)"
  end
end
