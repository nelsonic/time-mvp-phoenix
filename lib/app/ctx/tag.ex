defmodule App.Ctx.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :text, :string
    belongs_to :person, App.Ctx.Person
    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
