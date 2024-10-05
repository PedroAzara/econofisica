using Plots

# Função do mapa logístico
function logistic_map(r, y0, n_iters)
    y = y0
    for i in 1:n_iters
        y = 4 * r * y * (1 - y)
    end
    return y
end

# Parâmetros
n_iters = 900      # Número total de iterações
n_transiente = 800     # Descartar as primeiras 800 iterações (transiente)
n_pontos_plot = 200    # Quantidade de pontos por valor de r (após o transiente)
y0 = 0.99               # Valor inicial de y₀

# Lista de valores de r de 0 a 1
r_values = 0:0.001:1.0

# Inicializa os vetores para armazenar os resultados
rs = Float64[]  # Vetor para os valores de r
ys = Float64[]  # Vetor para os valores de y

# Loop sobre os valores de r
for r in r_values
    y = y0
    # Executa o número total de iterações
    for i in 1:n_iters
        y = logistic_map(r, y, 1)
        # Após o transiente, armazena os valores de y
        if i > n_transiente
            push!(rs, r)  # Armazena o valor de r correspondente
            push!(ys, y)  # Armazena o valor de y
        end
    end
end

# Plotar os resultados
plot(rs, ys, st=:scatter, ms=1, label="", xlabel="r", ylabel="População", title="População em função de r")
