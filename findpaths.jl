# Given an adjacency list representing a directed graph,
# return a list of all paths from a given start and end point

g = Dict(0 => [3],
         1 => [0,2,4],
         2 => [7],
         3 => [4,5],
         4 => [1,6],
         5 => [6],
         6 => [7],
         7 => []
         )

function findpaths(graph, location, destination, path=[location])
    if location == destination
      return [path]
    else
        results = []
        choices = [choice for choice in graph[location] if choice ∉ path]
        for choice in choices
            result = findpaths(graph, choice, destination, vcat(path, choice))
            results = vcat(results, result)
        end
    end
    results
end
