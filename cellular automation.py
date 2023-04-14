import numpy as np
import matplotlib.pyplot as plt

def cellular_automaton(rule, seed, t, N):
    # Define the transition rule as a binary array
    transition_table = np.array([int(x) for x in np.binary_repr(rule, 8)])
    # Define the initial seed as a binary array
    if seed == "single":
        initial_seed = np.zeros(N, dtype=int)
        initial_seed[N // 2] = 1
