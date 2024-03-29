defmodule BitguideWeb.AgentLive.Index do
  use BitguideWeb, :live_view

  alias Bitguide.Chats
  alias Bitguide.Chats.Agent

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :agents, Chats.list_agents())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Agent")
    |> assign(:agent, Chats.get_agent!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Agent")
    |> assign(:agent, %Agent{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Agents")
    |> assign(:agent, nil)
  end

  @impl true
  def handle_info({BitguideWeb.AgentLive.FormComponent, {:saved, agent}}, socket) do
    {:noreply, stream_insert(socket, :agents, agent)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    agent = Chats.get_agent!(id)
    {:ok, _} = Chats.delete_agent(agent)

    {:noreply, stream_delete(socket, :agents, agent)}
  end
end
