from database import (
    create_connection,
    view_fatalities,
    add_enthusiast,
    update_weather,
    delete_fatality
)


def menu():
    print("\n=== Colorado Outdoor Caution Database ===")
    print("1. View Fatalities")
    print("2. Add Enthusiast")
    print("3. Update Weather")
    print("4. Delete Fatality")
    print("5. Exit")


def main():
    connection = create_connection()

    if connection is None:
        print("no database connection")
        return

    while True:
        menu()
        choice = input("choose option: ")

        if choice == "1":
            view_fatalities(connection)

        elif choice == "2":
            add_enthusiast(connection)

        elif choice == "3":
            update_weather(connection)

        elif choice == "4":
            delete_fatality(connection)

        elif choice == "5":
            print("exiting...")
            break

        else:
            print("invalid choice")


    connection.close()


if __name__ == "__main__":
    main()