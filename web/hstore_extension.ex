defmodule PendrellVale.HStoreExtension do
  alias Postgrex.TypeInfo
  alias Postgrex.Extensions.Binary
  @behaviour Postgrex.Extension

  def init(_parameters, _opts), do: []

  def matching(_), do: [type: "hstore"]

  def format(_), do: :binary

  def decode(info = %TypeInfo{type: "hstore"}, bin, types, opts) do
    Binary.decode %TypeInfo{info | send: "hstore_send"}, bin, types, opts
  end

  def encode(info = %TypeInfo{type: "hstore"}, map, types, opts) do
    Binary.encode %TypeInfo{info | send: "hstore_send"}, map, types, opts
  end
end
