defmodule Sequel do
  def create(x) do
    [{:create, x}]
  end

  def insert(x) do
    [{:insert, x}]
  end

  def execute([{:create, [{:table, name} | fields]}]) do
    Sequel.Table.create(name, fields)
  end

  def execute([{:insert, [{:table, name} | fields]}]) do
    Sequel.Table.insert(name, fields)
  end

  def execute([{:select, column}, {:from, table}]) do
    Sequel.Table.select(table, column)
  end

  def execute([{:delete, [table: _name]}]) do

  end
end
