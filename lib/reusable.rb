module Reusable

  def group_by_day_and_sum(column)
    result = group_by_day(column).count
    keys = result.keys
    for i in 0..keys.size-1 do
      result[keys[i]] += result[keys[i-1]] if result[keys[i-1]]
    end
    result
  end
end
