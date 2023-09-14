defmodule CanalNoticias.NoticierosTest do
  use CanalNoticias.DataCase

  alias CanalNoticias.Noticieros

  describe "noticieros" do
    alias CanalNoticias.Noticieros.Noticiero

    import CanalNoticias.NoticierosFixtures

    @invalid_attrs %{nombre: nil, numero_programas: nil, pais: nil, idioma: nil}

    test "list_noticieros/0 returns all noticieros" do
      noticiero = noticiero_fixture()
      assert Noticieros.list_noticieros() == [noticiero]
    end

    test "get_noticiero!/1 returns the noticiero with given id" do
      noticiero = noticiero_fixture()
      assert Noticieros.get_noticiero!(noticiero.id) == noticiero
    end

    test "create_noticiero/1 with valid data creates a noticiero" do
      valid_attrs = %{nombre: "some nombre", numero_programas: 42, pais: "some pais", idioma: "some idioma"}

      assert {:ok, %Noticiero{} = noticiero} = Noticieros.create_noticiero(valid_attrs)
      assert noticiero.nombre == "some nombre"
      assert noticiero.numero_programas == 42
      assert noticiero.pais == "some pais"
      assert noticiero.idioma == "some idioma"
    end

    test "create_noticiero/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Noticieros.create_noticiero(@invalid_attrs)
    end

    test "update_noticiero/2 with valid data updates the noticiero" do
      noticiero = noticiero_fixture()
      update_attrs = %{nombre: "some updated nombre", numero_programas: 43, pais: "some updated pais", idioma: "some updated idioma"}

      assert {:ok, %Noticiero{} = noticiero} = Noticieros.update_noticiero(noticiero, update_attrs)
      assert noticiero.nombre == "some updated nombre"
      assert noticiero.numero_programas == 43
      assert noticiero.pais == "some updated pais"
      assert noticiero.idioma == "some updated idioma"
    end

    test "update_noticiero/2 with invalid data returns error changeset" do
      noticiero = noticiero_fixture()
      assert {:error, %Ecto.Changeset{}} = Noticieros.update_noticiero(noticiero, @invalid_attrs)
      assert noticiero == Noticieros.get_noticiero!(noticiero.id)
    end

    test "delete_noticiero/1 deletes the noticiero" do
      noticiero = noticiero_fixture()
      assert {:ok, %Noticiero{}} = Noticieros.delete_noticiero(noticiero)
      assert_raise Ecto.NoResultsError, fn -> Noticieros.get_noticiero!(noticiero.id) end
    end

    test "change_noticiero/1 returns a noticiero changeset" do
      noticiero = noticiero_fixture()
      assert %Ecto.Changeset{} = Noticieros.change_noticiero(noticiero)
    end
  end
end
