defmodule PetsAndOwners.PropietariosTest do
  use PetsAndOwners.DataCase

  alias PetsAndOwners.Propietarios

  describe "propietarios" do
    alias PetsAndOwners.Propietarios.Propietario

    import PetsAndOwners.PropietariosFixtures

    @invalid_attrs %{num_iden: nil, apellido: nil, fecha_nac: nil, edad: nil}

    test "list_propietarios/0 returns all propietarios" do
      propietario = propietario_fixture()
      assert Propietarios.list_propietarios() == [propietario]
    end

    test "get_propietario!/1 returns the propietario with given id" do
      propietario = propietario_fixture()
      assert Propietarios.get_propietario!(propietario.id) == propietario
    end

    test "create_propietario/1 with valid data creates a propietario" do
      valid_attrs = %{num_iden: "some num_iden", apellido: "some apellido", fecha_nac: ~D[2023-09-05], edad: 42}

      assert {:ok, %Propietario{} = propietario} = Propietarios.create_propietario(valid_attrs)
      assert propietario.num_iden == "some num_iden"
      assert propietario.apellido == "some apellido"
      assert propietario.fecha_nac == ~D[2023-09-05]
      assert propietario.edad == 42
    end

    test "create_propietario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Propietarios.create_propietario(@invalid_attrs)
    end

    test "update_propietario/2 with valid data updates the propietario" do
      propietario = propietario_fixture()
      update_attrs = %{num_iden: "some updated num_iden", apellido: "some updated apellido", fecha_nac: ~D[2023-09-06], edad: 43}

      assert {:ok, %Propietario{} = propietario} = Propietarios.update_propietario(propietario, update_attrs)
      assert propietario.num_iden == "some updated num_iden"
      assert propietario.apellido == "some updated apellido"
      assert propietario.fecha_nac == ~D[2023-09-06]
      assert propietario.edad == 43
    end

    test "update_propietario/2 with invalid data returns error changeset" do
      propietario = propietario_fixture()
      assert {:error, %Ecto.Changeset{}} = Propietarios.update_propietario(propietario, @invalid_attrs)
      assert propietario == Propietarios.get_propietario!(propietario.id)
    end

    test "delete_propietario/1 deletes the propietario" do
      propietario = propietario_fixture()
      assert {:ok, %Propietario{}} = Propietarios.delete_propietario(propietario)
      assert_raise Ecto.NoResultsError, fn -> Propietarios.get_propietario!(propietario.id) end
    end

    test "change_propietario/1 returns a propietario changeset" do
      propietario = propietario_fixture()
      assert %Ecto.Changeset{} = Propietarios.change_propietario(propietario)
    end
  end
end
