defmodule NameBadge do
  def print(id, name, department) do
    department_or_owner =
      if department == nil,
        do: "OWNER",
        else: String.upcase(department)

    if id == nil do
      "#{name} - #{department_or_owner}"
    else
      "[#{id}] - #{name} - #{department_or_owner}"
    end
  end
end
