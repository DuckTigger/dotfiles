#!/bin/bash

# Script to open a STIM circuit in locally running Crumble
# Usage: ./open_stim_in_crumble.sh "CIRCUIT_STRING"

set -e  # Exit on any error

# Configuration - update these paths to match your setup
VENV_PATH="$HOME/.virtualenvs/stim/"  # Change this to your venv path (e.g., "./my_stim_env" or "/path/to/your/venv")
PATH_TO_STIM="$HOME/Documents/Riverlane/stim"  # Change this to your STIM installation path
CRUMBLE_PORT="8000"  # Default HTTP server port
PYTHON_SCRIPT="$HOME/dotfiles/stim_to_crumble.py"
# Parse verbose flag
VERBOSE=false
ARGS=()
while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        *)
            ARGS+=("$1")
            shift
            ;;
    esac
done

# Function for verbose output
vecho() {
    if [ "$VERBOSE" = true ]; then
        echo "$@"
    fi
}

# Get circuit string from argument, file, or stdin
if [ ${#ARGS[@]} -eq 1 ] && [ "${ARGS[0]}" != "-f" ]; then
    # Circuit provided as argument
    CIRCUIT_STRING="${ARGS[0]}"
elif [ ${#ARGS[@]} -eq 2 ] && [ "${ARGS[0]}" = "-f" ]; then
    # Circuit provided as file
    CIRCUIT_FILE="${ARGS[1]}"
    if [ ! -f "$CIRCUIT_FILE" ]; then
        echo "Error: File '$CIRCUIT_FILE' not found" >&2
        exit 1
    fi
    CIRCUIT_STRING=$(cat "$CIRCUIT_FILE")
elif [ ${#ARGS[@]} -eq 0 ] && [ ! -t 0 ]; then
    # Circuit piped from stdin
    CIRCUIT_STRING=$(cat)
else
    echo "Usage: $0 [-v] \"CIRCUIT_STRING\"" >&2
    echo "   or: $0 [-v] -f circuit_file.txt" >&2
    echo "   or: cat circuit_file.txt | $0 [-v]" >&2
    echo "   or: python generate_circuit.py | $0 [-v]" >&2
    echo "" >&2
    echo "Options:" >&2
    echo "  -v, --verbose    Show detailed output" >&2
    exit 1
fi

# Check if Python script exists
if [ ! -f "$PYTHON_SCRIPT" ]; then
    echo "Error: $PYTHON_SCRIPT not found in current directory" >&2
    exit 1
fi

# Check if STIM path exists
if [ ! -d "$PATH_TO_STIM/glue/crumble" ]; then
    echo "Error: Crumble directory not found at $PATH_TO_STIM/glue/crumble" >&2
    echo "Please update PATH_TO_STIM in the script to point to your STIM installation" >&2
    exit 1
fi

# Function to check if Crumble server is running
check_server() {
    curl -s "http://localhost:$CRUMBLE_PORT" > /dev/null 2>&1
}

# Function to start Crumble server
start_crumble_server() {
    vecho "Starting Crumble server on port $CRUMBLE_PORT..."
    cd "$PATH_TO_STIM/glue/crumble"
    python -m http.server $CRUMBLE_PORT > /dev/null 2>&1 &
    SERVER_PID=$!
    cd - > /dev/null
    
    # Wait for server to start
    vecho "Waiting for server to start..."
    for i in {1..10}; do
        if check_server; then
            vecho "Crumble server started successfully (PID: $SERVER_PID)"
            return 0
        fi
        sleep 1
    done
    
    echo "Warning: Server may not have started properly" >&2
    return 1
}

# Check if Crumble server is already running
if ! check_server; then
    start_crumble_server
else
    vecho "Crumble server already running on port $CRUMBLE_PORT"
fi

# Check if virtual environment exists
if [ ! -d "$VENV_PATH" ]; then
    echo "Error: Virtual environment not found at $VENV_PATH" >&2
    echo "Please update VENV_PATH in the script to point to your virtual environment" >&2
    exit 1
fi

# Source the virtual environment
vecho "Activating virtual environment at $VENV_PATH..."
source "$VENV_PATH/bin/activate"

# Get the Crumble URL from the Python script
vecho "Converting STIM circuit to Crumble URL..."
CRUMBLE_URL=$(python "$PYTHON_SCRIPT" "$CIRCUIT_STRING")

if [ $? -ne 0 ]; then
    echo "Error: Failed to convert circuit to Crumble URL" >&2
    exit 1
fi

# Replace the online Crumble URL with local server URL
LOCAL_CRUMBLE_URL=${CRUMBLE_URL/https:\/\/algassert.com\/crumble#circuit=/http:\/\/localhost:$CRUMBLE_PORT\/crumble.html#circuit=}

vecho "Local Crumble URL: $LOCAL_CRUMBLE_URL"

# Give the server a moment to fully initialise if we just started it
if [ -n "$SERVER_PID" ]; then
    sleep 2
fi

# Open in default browser (works on most Linux distributions and macOS)
if command -v xdg-open > /dev/null; then
    # Linux
    xdg-open "$LOCAL_CRUMBLE_URL"
elif command -v open > /dev/null; then
    # macOS
    open "$LOCAL_CRUMBLE_URL"
else
    echo "Cannot automatically open browser. Please open this URL manually:"
    echo "$LOCAL_CRUMBLE_URL"
fi
