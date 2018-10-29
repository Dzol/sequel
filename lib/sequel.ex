defmodule Sequel do
  def create(x) do
    [{:create, x}]
  end

  def execute([{:create, [{:table, name} | fields]}]) do
    Sequel.Table.create(name, fields)
  end

  def execute([{:delete, [table: _name]}]) do

  end
end
