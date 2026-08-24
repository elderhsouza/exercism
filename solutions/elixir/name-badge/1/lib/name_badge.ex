defmodule NameBadge do
  def print(id, name, department) do
    emp_id = if id == nil, do: "", else: "[#{id}] - "
    emp_department = if department == nil, do: "OWNER", else: String.upcase(department)
    
    "#{emp_id}#{name} - #{emp_department}"
  end
end
