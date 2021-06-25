defmodule WabanexWeb.GraphQL.Resolvers.Training do
  alias Wabanex.Training

  # def get(%{id: user_id}, _context), do: Training.Get.get_user(user_id)

  def create(%{input: attrs}, _context), do: Training.Create.create_training(attrs)

  def index(_, _), do: Training.Index.trainings()
end
