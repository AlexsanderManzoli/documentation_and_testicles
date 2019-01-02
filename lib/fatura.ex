defmodule Fatura do
  
  @moduledoc """
  Este módulo executamos funções de faturas.
  """

  @doc """
  Ao receber `fatura` retorna um array de faturas.

  ## Examples

      iex> Fatura.criar_fatura(["Agua", "Luz","Teste"],[15, 10])
      ["Fatura: Agua vence no dia 15", 
      "Fatura: Luz vence no dia 15", 
      "Fatura: Teste vence no dia 15", "Fatura: Agua vence no dia 10", 
      "Fatura: Luz vence no dia 10", "Fatura: Teste vence no dia 10"]

  """
  def criar_fatura(faturas, vencimentos) do 
    for vencimento <- vencimentos, fatura <- faturas do
      "Fatura: #{fatura} vence no dia #{vencimento}"
    end
  end

  @doc """
  Ao receber `faturas` retorna um array de faturas ordenado por ordem alfabetica.

  ## Examplos

      iex> Fatura.ordenar_fatura(Fatura.criar_fatura(["Agua", "Luz","Teste"],[15, 10]))
      ["Fatura: Agua vence no dia 10", "Fatura: Agua vence no dia 15",
      "Fatura: Luz vence no dia 10", "Fatura: Luz vence no dia 15",
      "Fatura: Teste vence no dia 10", "Fatura: Teste vence no dia 15"]
  """
  def ordenar_fatura(faturas) do
    Enum.sort(faturas)
  end

  @doc """
  Ao receber uma lista de `fatura`, jutamente com a  `fatura` especifica verifica se ela existe

  ## Exemplos

      iex> Fatura.fatura_existe(["Agua", "Luz"],"Agua")
      true
  """
  def fatura_existe(faturas, fatura) do
    Enum.member?(faturas, fatura)
  end

  @doc """
  Seleciona uma as faturas que deseja pagar

  ## Exemplos

      iex> Fatura.faturas_a_pagar(Fatura.criar_fatura(["Agua", "Luz","Teste"],[15, 10]),1)
      {["Fatura: Agua vence no dia 15"],["Fatura: Luz vence no dia 15", 
      "Fatura: Teste vence no dia 15","Fatura: Agua vence no dia 10", 
      "Fatura: Luz vence no dia 10","Fatura: Teste vence no dia 10"]}
  """
  def faturas_a_pagar(faturas, quantidade) do
    Enum.split(faturas, quantidade)
  end
end
