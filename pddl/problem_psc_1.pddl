(define (problem play_socce_1)
  (:domain play_soccer)

  ;; Instantiate the objects.
  (:objects 
    B1 B2 B3 B4 B5 B6 R1 R2 R3 R4 R5 R6 - field_zone
    blue red - goal
    p1 p2 p3 e1 e2 e3 - player
  )

  (:init
    ; Define the initial state predicates.
    (ball_at_area R5)
    (player_has_ball p1)
  
    (teammate p1)
    (teammate p2)
    (teammate p3)
    (player_at p1 R5)
    (player_at p2 B3)
    (player_at P3 R2)
    (player_at e1 B2)
    (player_at e2 B5)
    (player_at e3 R1)

    (free_zone B1)
    ;; (free_zone B2)
    ;; (free_zone B3)
    (free_zone B4)
    ;; (free_zone B5)
    (free_zone B6)
    ;; (free_zone R1)
    ;; (free_zone R2)
    (free_zone R3)
    (free_zone R4)
    ;; (free_zone R5)
    (free_zone R6)


    (connected B1 B4)
    (connected B1 R3)
    (connected B1 B2)
    (connected B1 B5)
    (connected B1 R2)

    (connected R1 R4)
    (connected R1 B3)
    (connected R1 R2)
    (connected R1 R5)
    (connected R1 B2)

    (connected B2 B1)
    (connected B2 B2)
    (connected B2 B3)
    (connected B2 B4)
    (connected B2 B5)
    (connected B2 B6)
    (connected B2 R1)
    (connected B2 R2)
    (connected B2 R3)

    (connected R2 R1)
    (connected R2 R2)
    (connected R2 R3)
    (connected R2 R4)
    (connected R2 R5)
    (connected R2 R6)
    (connected R2 B1)
    (connected R2 B2)
    (connected R2 B3)

    (connected B3 B2)
    (connected B3 B5)
    (connected B3 B6)
    (connected B3 R1)
    (connected B3 R2)

    (connected R3 R2)
    (connected R3 R5)
    (connected R3 R6)
    (connected R3 B1)
    (connected R3 B2)

    (connected B4 B1)
    (connected B4 B2)
    (connected B4 B5)
    (connected B4 blue)

    (connected R4 R1)
    (connected R4 R2)
    (connected R4 R5)
    (connected R4 red)

    (connected B6 B2)
    (connected B6 B3)
    (connected B6 B5)
    (connected B6 blue)

    (connected R6 R2)
    (connected R6 R3)
    (connected R6 R5)
    (connected R6 red)

    (connected B5 B1)
    (connected B5 B2)
    (connected B5 B3)
    (connected B5 B4)
    (connected B5 B5)
    (connected B5 B6)    
    (connected B5 blue)

    (connected R5 R1)
    (connected R5 R2)
    (connected R5 R3)
    (connected R5 R4)
    (connected R5 R5)
    (connected R5 R6)    
    (connected R5 red)
  )

  (:goal (and
    (ball_in_goal blue)
  ))
)