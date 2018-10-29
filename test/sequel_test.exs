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

  test "three" do
    q = Sequel.create(table: Person, name: String, age: Integer, hobby: String)
    Sequel.execute(q)
    r = Sequel.insert(table: Person, name: "Alice", age: 32, hobby: "programming")
    Sequel.execute(r)
    s = [
      select: :age,
      from: Person
    ]
    assert Sequel.execute(s) == [32]
  end
end
