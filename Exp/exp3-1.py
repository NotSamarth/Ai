def dfs(x, y, target, visited, path):
    if (x, y) == target:
        return True

    visited.add((x, y))

    # Fill Jug 1
    if x < m and (m, y) not in visited:
        path.append((m, y))
        if dfs(m, y, target, visited, path):
            return True
        path.pop()

    # Fill Jug 2
    if y < n and (x, n) not in visited:
        path.append((x, n))
        if dfs(x, n, target, visited, path):
            return True
        path.pop()

    # Empty Jug 1
    if x > 0 and (0, y) not in visited:
        path.append((0, y))
        if dfs(0, y, target, visited, path):
            return True
        path.pop()

    # Empty Jug 2
    if y > 0 and (x, 0) not in visited:
        path.append((x, 0))
        if dfs(x, 0, target, visited, path):
            return True
        path.pop()

    # Pour from Jug 1 to Jug 2
    if x > 0:
        amount_to_pour = min(x, n - y)
        new_x, new_y = x - amount_to_pour, y + amount_to_pour
        if (new_x, new_y) not in visited:
            path.append((new_x, new_y))
            if dfs(new_x, new_y, target, visited, path):
                return True
            path.pop()

    # Pour from Jug 2 to Jug 1
    if y > 0:
        amount_to_pour = min(y, m - x)
        new_x, new_y = x + amount_to_pour, y - amount_to_pour
        if (new_x, new_y) not in visited:
            path.append((new_x, new_y))
            if dfs(new_x, new_y, target, visited, path):
                return True
            path.pop()

    return False

def find_path(m, n, d):
    if d > max(m, n) or d == 0:
        return None

    visited = set()
    path = [(0, 0)]

    if dfs(0, 0, (0, d), visited, path):
        return path
    else:
        return None

# Example usage:
m = 5  # Capacity of Jug 1
n = 3  # Capacity of Jug 2
d = 4  # Desired amount of water

path = find_path(m, n, d)
if path:
    print("Path found:")
    for state in path:
        print(state)
else:
    print("No path exists to measure the desired amount.")
