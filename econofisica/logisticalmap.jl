using Plots

# Função do mapa logístico
function logistic_map(r, y0, n_iters)
    y = y0
    for i in 1:n_iters
        y = 4 * r * y * (1 - y)
    end
    return y
end

# Função para fazer zoom em um intervalo específico de r
function zoom(r_start, r_end, n_iters, n_transiente, y0)
    r_values = r_start:0.001:r_end  # Lista de valores de r no intervalo desejado
    rs_zoom = Float64[]  # Vetor para os valores de r
    ys_zoom = Float64[]  # Vetor para os valores de y

    # Loop sobre os valores de r no intervalo especificado
    for r in r_values
        y = y0
        # Executa o número total de iterações
        for i in 1:n_iters
            y = logistic_map(r, y, 1)
            # Após o transiente, armazena os valores de y
            if i > n_transiente
                push!(rs_zoom, r)  # Armazena o valor de r correspondente
                push!(ys_zoom, y)  # Armazena o valor de y
            end
        end
    end

    # Plotar os resultados no intervalo especificado
    plot(rs_zoom, ys_zoom, st=:scatter, ms=1, label="", xlabel="r", ylabel="População", title="Zoom da População em função de r")
end

# Parâmetros
n_iters = 900      # Número total de iterações
n_transiente = 800     # Descartar as primeiras 800 iterações (transiente)
n_pontos_plot = 200    # Quantidade de pontos por valor de r (após o transiente)
y0 = 0.0006               # Valor inicial de y₀

# Função de zoom exemplo
zoom(0, 1, n_iters, n_transiente, y0)