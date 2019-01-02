defmodule FaturaTest do
    use ExUnit.Case
    doctest Fatura

    test "deve criar uma lista de faturas" do
        faturas = Fatura.criar_fatura(["Agua", "Luz","Teste"],[15, 10])
        assert faturas == ["Fatura: Agua vence no dia 15", "Fatura: Luz vence no dia 15", "Fatura: Teste vence no dia 15", "Fatura: Agua vence no dia 10", "Fatura: Luz vence no dia 10", "Fatura: Teste vence no dia 10"]
    end

    test "Deve ordenar um a lista de faturas" do 
        faturas = Fatura.criar_fatura(["Agua", "Luz","Teste"],[15, 10])
        refute Fatura.ordenar_fatura(faturas) == ["Agua", "Telefone", "Luz"]
    end
end