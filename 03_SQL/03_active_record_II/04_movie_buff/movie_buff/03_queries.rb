def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  # RESUME
  Movie.joins(:actors).select(:id, :title)

end

def golden_age
  # Find the decade with the highest average movie score.

end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  actors = Actor.find_by_sql(<<-SQL)
    SELECT
      actors.name
    FROM
      actors
    JOIN
      castings ON castings.actor_id = actors.id
    WHERE
      castings.movie_id IN (
        SELECT
          castings.movie_id
        FROM
          castings
        JOIN
          actors ON actors.id = castings.actor_id
        WHERE
          actors.name = "Humphrey Bogart"
      )
  SQL

  actors.pluck(:name)

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

  actors =  Actor.find_by_sql(<<-SQL)
    SELECT
      COUNT(*)
    FROM
      actors
    WHERE
      actors.id NOT IN (
        SELECT
          castings.actor_id
        FROM
          castings
      )
    GROUP BY
        actors.id
  SQL

  actors.count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end


#  Actor.find_by_sql(<<-SQL)
#     SELECT
#       COUNT(*)
#     FROM
#       actors
#     WHERE
#       actors.id NOT IN (
#         SELECT
#           castings.actor_id
#         FROM
#           castings
#       )
#   SQL





#   Actor.find_by_sql(<<-SQL)
#     SELECT
#       actors.name
#     FROM
#       actors
#     JOIN
#       castings ON castings.actor_id = actors.id
#     WHERE
#       castings.movie_id IN (
#         SELECT
#           castings.movie_id
#         FROM
#           castings
#         JOIN
#           actors ON actors.id = castings.actor_id
#         WHERE
#           actors.name = 'Dave Chapelle'
#       )
#   SQL




  # actors = Actor.find_by_sql(<<-SQL)
  #   SELECT
  #     actors.name
  #   FROM
  #     actors
  #   JOIN
  #     castings ON castings.actor_id = actors.id
  #   WHERE
  #     castings.movie_id IN (
  #       SELECT
  #         castings.movie_id
  #       FROM
  #         castings
  #       JOIN
  #         actors ON actors.id = castings.actor_id
  #       WHERE
  #         actors.name = 'Julie Andrews'
  #     )
  # SQL

  # actors.pluck(:name)