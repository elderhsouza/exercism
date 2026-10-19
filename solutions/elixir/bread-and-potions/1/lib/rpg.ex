defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  # Edible protocol
  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    def eat(%LoafOfBread{}, %Character{} = character),
      do: {nil, %Character{character | health: character.health + 5}}
  end

  defimpl Edible, for: ManaPotion do
    def eat(%ManaPotion{} = potion, %Character{} = character),
      do: {%EmptyBottle{}, %Character{character | mana: character.mana + potion.strength}}
  end

  defimpl Edible, for: Poison do
    def eat(%Poison{}, %Character{} = character),
      do: {%EmptyBottle{}, %Character{character | health: 0}}
  end
end
