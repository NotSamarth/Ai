import itertools

def tsp_brute_force(cost_matrix):
    num_cities = len(cost_matrix)
    cities = list(range(num_cities))
    shortest_tour = None
    shortest_distance = float('inf')

    for tour in itertools.permutations(cities):
        tour_distance = sum(cost_matrix[tour[i - 1]][tour[i]] for i in range(num_cities))
        if tour_distance < shortest_distance:
            shortest_tour = tour
            shortest_distance = tour_distance

    return shortest_tour, shortest_distance

if __name__ == "__main__":
    n = int(input("Enter number of cities: "))
    cost = [[0 for _ in range(n)] for _ in range(n)]

    for i in range(n):
        for j in range(n):
            if cost[j][i] == 0:
                if i != j:
                    cost[i][j] = int(input(f"Enter distance between city {i+1} and {j+1}: "))
                else:
                    cost[i][j] = 0
            cost[j][i] = cost[i][j]

    shortest_tour, shortest_distance = tsp_brute_force(cost)
    print("Shortest tour:", shortest_tour)
    print("Shortest distance:", shortest_distance)