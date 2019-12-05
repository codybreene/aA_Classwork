# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      yr
    FROM
      nobels
    GROUP BY 1
    HAVING COUNT(CASE WHEN subject = 'Physics' THEN 1 ELSE NULL END) >= 1 
      AND COUNT(CASE WHEN subject = 'Chemistry' THEN 1 ELSE NULL END) = 0
  SQL
end
