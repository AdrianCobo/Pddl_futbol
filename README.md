# Pddl_futbol

En este ejericio se pide un fichero PDDL con el dominio y varios (al menos 3) ficheros con el problema PDDL representativos.

El dominio debe permitir:

- Simular un partido de futbol donde solo se muevan tus jugadores y los rivales no.

Acciones implementadas:

- move
- dribble
- pass
- kick
- take_ball

# Ejecucion:

1. tener instalado popf
2. $ ros2 run popf popf pddl/a_cobo_2020_domain.pddl pddl/problem_psc_1.pddl
