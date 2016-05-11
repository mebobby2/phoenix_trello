defmodule PhoenixTrello.BoardChannel do
  @moduledoc """
  Board channel
  """

  use PhoenixTrello.Web, :channel

  alias PhoenixTrello.{User, Board, UserBoard, List, Card, Comment, CardMember}
  alias PhoenixTrello.BoardChannel.Monitor

  def join("boards:" <> board_id, _params, socket) do
    current_user = socket.assigns.current_user
    board = get_current_board(socket, board_id)

    Monitor.create(board_id)

    send(self, {:after_join, Monitor.user_joined(board_id, current_user.id)})

    {:ok, %{board: board}, assign(socket, :board, board)}
  end

  defp get_current_board(socket, board_id) do
    socket.assigns.current_user
    |> assoc(:boards)
    |> Board.preload_all
    |> Repo.get(board_id)
  end

  defp get_current_board(socket), do: get_current_board(socket, socket.assigns.board.id)
end
