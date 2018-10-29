defmodule Sequel.Table do
  defmodule ETS do
    def insert(data, name) do
      :ets.insert(name, data)
    end
  end

  def create(name, fields) do
    if okay?(fields) do
      :ets.new(name, [:set, :public, :named_table])
    end
  end

  def insert(name, data) do
    data
    |> Keyword.values()
    |> List.to_tuple()
    |> ETS.insert(name)
  end

  def select(name, column) do
    :ets.foldl(& [Kernel.elem(&1, 1) | &2], [], name)
  end

  defp okay?(fields) do
    known? = & &1 in [Integer, String, Float]

    fields
    |> Keyword.values()
    |> Enum.map(known?)
    |> Enum.all?()
  end
end
