defmodule CanalNoticias.PresentadoresTest do
  use CanalNoticias.DataCase

  alias CanalNoticias.Presentadores

  describe "presentadores" do
    alias CanalNoticias.Presentadores.Presentador

    import CanalNoticias.PresentadoresFixtures

    @invalid_attrs %{nombre: nil, edad: nil, programa: nil}

    test "list_presentadores/0 returns all presentadores" do
      presentador = presentador_fixture()
      assert Presentadores.list_presentadores() == [presentador]
    end

    test "get_presentador!/1 returns the presentador with given id" do
      presentador = presentador_fixture()
      assert Presentadores.get_presentador!(presentador.id) == presentador
    end

    test "create_presentador/1 with valid data creates a presentador" do
      valid_attrs = %{nombre: "some nombre", edad: 42, programa: "some programa"}

      assert {:ok, %Presentador{} = presentador} = Presentadores.create_presentador(valid_attrs)
      assert presentador.nombre == "some nombre"
      assert presentador.edad == 42
      assert presentador.programa == "some programa"
    end

    test "create_presentador/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Presentadores.create_presentador(@invalid_attrs)
    end

    test "update_presentador/2 with valid data updates the presentador" do
      presentador = presentador_fixture()
      update_attrs = %{nombre: "some updated nombre", edad: 43, programa: "some updated programa"}

      assert {:ok, %Presentador{} = presentador} = Presentadores.update_presentador(presentador, update_attrs)
      assert presentador.nombre == "some updated nombre"
      assert presentador.edad == 43
      assert presentador.programa == "some updated programa"
    end

    test "update_presentador/2 with invalid data returns error changeset" do
      presentador = presentador_fixture()
      assert {:error, %Ecto.Changeset{}} = Presentadores.update_presentador(presentador, @invalid_attrs)
      assert presentador == Presentadores.get_presentador!(presentador.id)
    end

    test "delete_presentador/1 deletes the presentador" do
      presentador = presentador_fixture()
      assert {:ok, %Presentador{}} = Presentadores.delete_presentador(presentador)
      assert_raise Ecto.NoResultsError, fn -> Presentadores.get_presentador!(presentador.id) end
    end

    test "change_presentador/1 returns a presentador changeset" do
      presentador = presentador_fixture()
      assert %Ecto.Changeset{} = Presentadores.change_presentador(presentador)
    end
  end
end
