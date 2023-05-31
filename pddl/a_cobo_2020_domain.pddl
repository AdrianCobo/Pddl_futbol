(define (domain play_soccer)
  (:requirements :typing :fluents :durative-actions :universal-preconditions :conditional-effects :continuous-effects)

  (:types
    field_zone goal - field_zone
    player
  )

  (:predicates
    (ball_at_area ?f - field_zone)
    (player_has_ball ?p - player)
    (teammate ?p - player)
    (player_at ?p - player ?f - field_zone)
    (free_zone ?f - field_zone)
    (connected ?l1 ?l2 - field_zone)

    (ball_in_goal ?g - goal)
  )

  (:durative-action move
    :parameters (?p - player ?from ?to - field_zone)
    :duration ( = ?duration 3)
    :condition (and
      (at start(player_at ?p ?from))
      (at start(connected ?from ?to))
      (at start(free_zone ?to))
    )
    :effect (and
      (at start(not (player_at ?p ?from)))
      (at start(not(free_zone ?to)))
      (at end(player_at ?p ?to))
      (at end(free_zone ?from))
    )
  )

  (:durative-action dribble
    :parameters (?r - player ?from ?to - field_zone)
    :duration ( = ?duration 4)
    :condition (and
      (at start(player_at ?r ?from))
      (at start(connected ?from ?to))
      (at start(player_has_ball ?r))
      (at start(free_zone ?to))
      (at start(ball_at_area ?from))
    )
    :effect (and
      (at start(not (player_at ?r ?from)))
      (at start(not(free_zone ?to)))
      (at start(not (ball_at_area ?from)))
      (at end(player_at ?r ?to))
      (at end(free_zone ?from))
      (at end(ball_at_area ?to))
    )
  )

  (:durative-action pass
    :parameters (?a ?b - player ?r1 ?r2 - field_zone)
    :duration (= ?duration 2)
    :condition (and
      (at start(player_has_ball ?a))
      (at start(player_at ?a ?r1))
      (at start(player_at ?b ?r2))
      (at start(teammate ?b))
      (at start(teammate ?a))
      (at start(ball_at_area ?r1))
    )
    :effect (and
      (at start(not (player_has_ball ?a)))
      (at start(not (ball_at_area ?r1)))
      (at end(player_has_ball ?b))
      (at end(ball_at_area ?r2))
    )
  )

  (:durative-action kick
    :parameters (?a - player ?r1 - field_zone ?g - goal)
    :duration (= ?duration 1)
    :condition (and
      (at start(player_has_ball ?a))
      (at start(connected ?r1 ?g))
      (at start(player_at ?a ?r1))
      (at start(ball_at_area ?r1))
      (at start(teammate ?a))
    )
    :effect (and
      (at start(not (player_has_ball ?a)))
      (at end(ball_in_goal ?g))
    )
  )

  (:durative-action take_ball
    :parameters (?a - player ?r1 - field_zone)
    :duration (= ?duration 1)
    :condition (and
      (at start(ball_at_area ?r1))
      (at start(player_at ?a ?r1))
    )
    :effect (and
      (at end(player_has_ball ?a))
    )
  )
)

