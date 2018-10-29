defmodule Sequel.Table do
  def create(name, fields) do
    if okay?(fields) do
      :ets.new(name, [:set, :public, :named_table])
    end
  end

  defp okay?(fields) do
    known? = & &1 in [Integer, String, Float]

    fields
    |> Keyword.values()
    |> Enum.map(known?)
    |> Enum.all?()
  end
end
