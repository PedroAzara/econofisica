using Plots



# Número de iterações (por exemplo, calcular os primeiros 10 termos)
n = 200

# Função para calcular os valores de y usando o mapa logístico
function calculo(r, y0, n)
    y = zeros(n+1)  # Inicializa um vetor de zeros com n+1 posições
    y[1] = y0       # Define o valor inicial
    for i in 1:n
        y[i+1] = 4*r * y[i] * (1 - y[i])  # Aplicação do mapa logístico
    end
    return y
end

# Calculando os valores para diferentes parâmetros
y1 = calculo(0.95 , 0.8, n)
# y2 = calculo(0.24, 0.5, n)

# Criando o eixo x com o número de iterações
x = 0:n

# Plotando os resultados
plot(x, y1, label="r=0.7, y0=0.1", xlabel="Iterações", ylabel="y", title="Mapa Logístico")
# plot!(x, y2, label="r=0.5, y0=0.2")  # Adiciona outra linha ao gráfico
