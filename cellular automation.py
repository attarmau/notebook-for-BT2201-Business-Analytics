import numpy as np
import matplotlib.pyplot as plt

def cellular_automaton(rule, seed, t, N):
    # Define the transition rule as a binary array
    transition_table = np.array([int(x) for x in np.binary_repr(rule, 8)])
    # Define the initial seed as a binary array
    if seed == "single":
        initial_seed = np.zeros(N, dtype=int)
        initial_seed[N // 2] = 1
        elif seed == "random":
        initial_seed = np.random.randint(0, 2, N)
    # Create an array to store the state of each cell for each iteration
    states = np.zeros((t, N), dtype=int)
    states[0] = initial_seed
    # Iterate over each row and apply the transition rule to each cell
    for i in range(1, t):
        for j in range(N):
            # Get the state of the cell and its neighbors in the previous row
            left = states[i-1, (j-1) % N]
            middle = states[i-1, j]
            right = states[i-1, (j+1) % N]
            # Use the transition rule to determine the state of the cell in the current row
            states[i, j] = transition_table[7 - (left * 4 + middle * 2 + right)]
    return states

