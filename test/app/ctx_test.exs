defmodule App.CtxTest do
  use App.DataCase

  alias App.Ctx

  describe "tags" do
    alias App.Ctx.Tag

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ctx.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Ctx.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Ctx.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Ctx.create_tag(@valid_attrs)
      assert tag.text == "some text"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ctx.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Ctx.update_tag(tag, @update_attrs)
      assert tag.text == "some updated text"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Ctx.update_tag(tag, @invalid_attrs)
      assert tag == Ctx.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Ctx.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Ctx.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Ctx.change_tag(tag)
    end
  end

  describe "status" do
    alias App.Ctx.Status

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def status_fixture(attrs \\ %{}) do
      {:ok, status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ctx.create_status()

      status
    end

    test "list_status/0 returns all status" do
      status_fixture()
      assert Enum.count(Ctx.list_status()) > 1
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert Ctx.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      assert {:ok, %Status{} = status} = Ctx.create_status(@valid_attrs)
      assert status.text == "some text"
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ctx.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()

      assert {:ok, %Status{} = status} =
               Ctx.update_status(status, @update_attrs)

      assert status.text == "some updated text"
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Ctx.update_status(status, @invalid_attrs)

      assert status == Ctx.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = Ctx.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> Ctx.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = Ctx.change_status(status)
    end
  end

  describe "items" do
    alias App.Ctx.{Item, List}

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ctx.create_item()

      item
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture(@valid_attrs)
      assert Ctx.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Ctx.create_item(@valid_attrs)
      assert item.text == "some text"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ctx.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Ctx.update_item(item, @update_attrs)
      assert item.text == "some updated text"
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Ctx.change_item(item)
    end
  end

  describe "lists" do
    alias App.Ctx.List

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ctx.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Ctx.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Ctx.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Ctx.create_list(@valid_attrs)
      assert list.title == "some title"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ctx.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = Ctx.update_list(list, @update_attrs)
      assert list.title == "some updated title"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Ctx.update_list(list, @invalid_attrs)
      assert list == Ctx.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Ctx.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Ctx.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Ctx.change_list(list)
    end
  end

  describe "timers" do
    alias App.Ctx.Timer

    @valid_attrs %{end: ~N[2010-04-17 14:00:00], start: ~N[2010-04-17 14:00:00]}
    @update_attrs %{
      end: ~N[2011-05-18 15:01:01],
      start: ~N[2011-05-18 15:01:01]
    }
    @invalid_attrs %{end: nil, start: nil}

    def timer_fixture(attrs \\ %{}) do
      {:ok, timer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ctx.create_timer()

      timer
    end

    test "list_timers/0 returns all timers" do
      timer = timer_fixture()
      assert Ctx.list_timers() == [timer]
    end

    test "get_timer!/1 returns the timer with given id" do
      timer = timer_fixture()
      assert Ctx.get_timer!(timer.id) == timer
    end

    test "create_timer/1 with valid data creates a timer" do
      assert {:ok, %Timer{} = timer} = Ctx.create_timer(@valid_attrs)
      assert timer.end == ~N[2010-04-17 14:00:00]
      assert timer.start == ~N[2010-04-17 14:00:00]
    end

    test "create_timer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ctx.create_timer(@invalid_attrs)
    end

    test "update_timer/2 with valid data updates the timer" do
      timer = timer_fixture()
      assert {:ok, %Timer{} = timer} = Ctx.update_timer(timer, @update_attrs)
      assert timer.end == ~N[2011-05-18 15:01:01]
      assert timer.start == ~N[2011-05-18 15:01:01]
    end

    test "update_timer/2 with invalid data returns error changeset" do
      timer = timer_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Ctx.update_timer(timer, @invalid_attrs)

      assert timer == Ctx.get_timer!(timer.id)
    end

    test "delete_timer/1 deletes the timer" do
      timer = timer_fixture()
      assert {:ok, %Timer{}} = Ctx.delete_timer(timer)
      assert_raise Ecto.NoResultsError, fn -> Ctx.get_timer!(timer.id) end
    end

    test "change_timer/1 returns a timer changeset" do
      timer = timer_fixture()
      assert %Ecto.Changeset{} = Ctx.change_timer(timer)
    end
  end
end
