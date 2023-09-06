defmodule PetsAndOwners.MascostasTest do
  use PetsAndOwners.DataCase

  alias PetsAndOwners.Mascostas

  describe "mascotas" do
    alias PetsAndOwners.Mascostas.Mascota

    import PetsAndOwners.MascostasFixtures

    @invalid_attrs %{nombre: nil, edad: nil, tipo: nil}

    test "list_mascotas/0 returns all mascotas" do
      mascota = mascota_fixture()
      assert Mascostas.list_mascotas() == [mascota]
    end

    test "get_mascota!/1 returns the mascota with given id" do
      mascota = mascota_fixture()
      assert Mascostas.get_mascota!(mascota.id) == mascota
    end

    test "create_mascota/1 with valid data creates a mascota" do
      valid_attrs = %{nombre: "some nombre", edad: 42, tipo: "some tipo"}

      assert {:ok, %Mascota{} = mascota} = Mascostas.create_mascota(valid_attrs)
      assert mascota.nombre == "some nombre"
      assert mascota.edad == 42
      assert mascota.tipo == "some tipo"
    end

    test "create_mascota/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mascostas.create_mascota(@invalid_attrs)
    end

    test "update_mascota/2 with valid data updates the mascota" do
      mascota = mascota_fixture()
      update_attrs = %{nombre: "some updated nombre", edad: 43, tipo: "some updated tipo"}

      assert {:ok, %Mascota{} = mascota} = Mascostas.update_mascota(mascota, update_attrs)
      assert mascota.nombre == "some updated nombre"
      assert mascota.edad == 43
      assert mascota.tipo == "some updated tipo"
    end

    test "update_mascota/2 with invalid data returns error changeset" do
      mascota = mascota_fixture()
      assert {:error, %Ecto.Changeset{}} = Mascostas.update_mascota(mascota, @invalid_attrs)
      assert mascota == Mascostas.get_mascota!(mascota.id)
    end

    test "delete_mascota/1 deletes the mascota" do
      mascota = mascota_fixture()
      assert {:ok, %Mascota{}} = Mascostas.delete_mascota(mascota)
      assert_raise Ecto.NoResultsError, fn -> Mascostas.get_mascota!(mascota.id) end
    end

    test "change_mascota/1 returns a mascota changeset" do
      mascota = mascota_fixture()
      assert %Ecto.Changeset{} = Mascostas.change_mascota(mascota)
    end
  end
end
