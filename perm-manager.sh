#!/bin/bash

echo "=== Linux Permission Manager ==="

# Display file information
show_info() {
    local file="$1"

    echo "Permissions: $(stat -c "%A" "$file")"
    echo "Numeric permissions: $(stat -c "%a" "$file")"
    echo "Owner: $(stat -c "%U" "$file")"
    echo "Group: $(stat -c "%G" "$file")"
}

# Validate the requested permission
is_valid_permission() {
    local permission="$1"

    case "$permission" in
        600|640|644|700|755)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Apply permissions to a file
apply_permission() {
    local permission="$1"
    local file="$2"

    if chmod "$permission" "$file"; then
        echo "Permission $permission applied successfully."
        return 0
    else
        echo "Error: Failed to change permissions."
        return 1
    fi
}

# Check whether the path is a valid file
check_file() {
    local file="$1"

    if [ -f "$file" ]; then
        return 0
    elif [ -d "$file" ]; then
        echo "Error: Path is a directory."
        return 1
    else
        echo "Error: File does not exist."
        return 1
    fi
}

# Display the interactive menu
menu() {
    while true
    do
        echo
        echo "1) Show file information"
        echo "2) Change permissions"
        echo "3) Exit"

        read -p "Choice: " choice

        case "$choice" in
            1)
                read -p "File: " file

                if check_file "$file"; then
                    show_info "$file"
                fi
                ;;

            2)
                read -p "File: " file

                if ! check_file "$file"; then
                    continue
                fi

                read -p "Permission: " permission

                if ! is_valid_permission "$permission"; then
                    echo "Error: Invalid permission."
                    echo "Allowed permissions: 600, 640, 644, 700, 755"
                    continue
                fi

                apply_permission "$permission" "$file"
                ;;

            3)
                echo "Exiting..."
                break
                ;;

            *)
                echo "Error: Invalid choice."
                ;;
        esac
    done
}

# Start interactive mode when no argument is provided
if [ -z "$1" ]; then
    menu
    exit 0
fi

# Check whether the permission argument is provided
if [ -z "$2" ]; then
    echo "Error: No permission specified."
    echo "Usage: ./perm-manager.sh <file> <permission>"
    exit 1
fi

# Check whether the specified path is a valid file
if ! check_file "$1"; then
    exit 1
fi

# Display current file information
show_info "$1"

# Validate the requested permission
if ! is_valid_permission "$2"; then
    echo "Error: Invalid permission."
    echo "Allowed permissions: 600, 640, 644, 700, 755"
    exit 1
fi

# Apply the requested permission
if ! apply_permission "$2" "$1"; then
    exit 1
fi

# Display the new permission
echo "Numeric permissions: $(stat -c "%a" "$1")"
