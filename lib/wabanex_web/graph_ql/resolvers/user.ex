defmodule WabanexWeb.GraphQL.Resolvers.User do
  alias Wabanex.User

  def get(%{id: user_id}, _context), do: User.Get.get_user(user_id)

  def create(%{input: attrs}, _context), do: User.Create.create_user(attrs)
end
