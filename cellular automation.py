import numpy as np
import matplotlib.pyplot as plt

def cellular_automaton(rule, seed, t, N):
    transition_table = np.array([int(x) for x in np.binary_repr(rule, 8)])     # Define the transition rule as a binary array

    if seed == "single":     # Define the initial seed as a binary array
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

def classify_ca(states):
    # Classify the cellular automaton based on the patterns it produces
    if np.all(states == 0) or np.all(states == 1):
        return "Class 1"
    elif np.array_equal(states[0], states[-1]):
        return "Class 2"
    elif np.max(np.abs(np.diff(states, axis=0))) <= 1:
        return "Class 3"
    else:
        return "Class 4"

# Create subplots for each rule and seed type
fig, axs = plt.subplots(6, 2, figsize=(10, 20))

# Rule 30
states_single = cellular_automaton(30, "single", 100, 200)
states_random = cellular_automaton(30, "random", 100, 200)
axs[0, 0].imshow(states_single, cmap="binary")
axs[0, 0].set_title("Rule 30 - Single Cell Seed")
axs[0, 1].imshow(states_random, cmap="binary")
axs[0, 1].set_title("Rule 30 - Random Seed\n{}".format(classify_ca(states_random)))

# Rule 54
states_single = cellular_automaton(54, "single", 100, 200)
states_random = cellular_automaton(54, "random", 100, 200)
axs[1, 0].imshow(states_single, cmap="binary")
axs[1, 0].set_title("Rule 54 - Single Cell Seed")
axs[1, 1].imshow(states_random, cmap="binary")
axs[1, 1].set_title("Rule 54 - Random Seed\n{}".format(classify_ca(states_random)))

# Rule 100 
states_single = cellular_automaton(54, 'single', 100, 200)
states_random  = cellular_automaton(54, 'random', 100, 200)
