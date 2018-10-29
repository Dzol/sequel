defmodule SequelTest do
  use ExUnit.Case

  test "one" do
    q = Sequel.create(table: Person, name: String, age: Integer, hobby: String)
    [
      {:create,
       [
	 {:table, Person},
	 {:name, String},
	 {:age, Integer},
	 {:hobby, String}
       ]
      }
    ]
    Sequel.execute(q)
    assert Enum.member?(:ets.all(), Person)
    assert :ets.tab2list(Person) == []
  end

  test "two" do
    assert Sequel.create(table: Person, name: String, age: Integer, hobby: String) != nil
  end
end
