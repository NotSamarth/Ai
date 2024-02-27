def is_valid_state(state):
    m, c, b = state
    if m < 0 or c < 0 or m > 3 or c > 3:
        return False
    if (m > 0 and m < c) or (m < 3 and (3 - m) < (3 - c)):
        return False
    return True

def get_children_states(state):
    children = []
    actions = [(1, 0, 1), (2, 0, 1), (0, 1, 1), (0, 2, 1), (1, 1, 1)]
    for action in actions:
        new_state = tuple(map(sum, zip(state, action)))
        if is_valid_state(new_state):
            children.append(new_state)
    return children

def dfs(current_state, goal_state, visited, path):
    if current_state == goal_state:
        return True

    visited.add(current_state)

    children_states = get_children_states(current_state)
    for child_state in children_states:
        if child_state not in visited:
            path.append(child_state)
            if dfs(child_state, goal_state, visited, path):
                return True
            path.pop()

    return False

def solve_missionaries_and_cannibals():
    initial_state = (3, 3, 1)
    goal_state = (0, 0, 0)
    visited = set()
    path = [initial_state]

    if dfs(initial_state, goal_state, visited, path):
        print("Solution found:")
        for state in path:
            print(state)
    else:
        print("No solution exists.")

solve_missionaries_and_cannibals()
