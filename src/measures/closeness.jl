function closeness_centrality{V}(
    g::AbstractGraph{V};
    normalized=true,
    weights=Float64[])

    nv = num_vertices(g)
    closeness = zeros(nv)

    for ui = 1:num_vertices(g)
        u = g.vertices[ui]
        d = dijkstra_shortest_paths(g,u).dists
        δ = filter(x->x!=Inf, d)
        σ = sum(δ)
        l = length(δ) - 1
        if σ > 0
            closeness[ui] = (l) / σ

            if normalized
                n = l / (nv-1)
                closeness[ui] *= n
            end
        else
            closeness[ui] = 0
        end
    end
    return closeness
end