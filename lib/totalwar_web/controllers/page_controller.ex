defmodule TotalwarWeb.PageController do
  use TotalwarWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
