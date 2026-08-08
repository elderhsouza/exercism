def steps:
  if . <= 0 then ("Only positive integers are allowed" | halt_error) else
    {number: ., steps: 0}
    | until(
      .number <= 1;
      {
        number: if .number % 2 == 0 then .number / 2 else (.number * 3) + 1 end,
        steps: .steps + 1  
      }
    ) 
    | .steps
  end
;
