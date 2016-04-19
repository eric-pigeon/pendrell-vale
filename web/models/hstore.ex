defmodule PendrellVale.HStore do
  @behaviour Ecto.Type

  def type, do: :hstore
  def cast(value), do: {:ok, value}
  def blank?(_), do: false

  def load(value) do
    {:ok, value}
  end

  def dump(value) do
    {:ok, value}
  end
end
