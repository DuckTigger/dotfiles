#!/usr/bin/env python3
"""
Convert a STIM circuit string to a Crumble URL.
Usage: python stim_to_crumble.py "CIRCUIT_STRING"
"""

import sys
import stim

def main():
    if len(sys.argv) != 2:
        print("Usage: python stim_to_crumble.py \"CIRCUIT_STRING\"", file=sys.stderr)
        sys.exit(1)
    
    circuit_string = sys.argv[1]
    
    try:
        # Parse the circuit string
        circuit = stim.Circuit(circuit_string)
        
        # Convert to Crumble URL
        crumble_url = circuit.to_crumble_url()
        
        # Output the URL
        print(crumble_url)
        
    except Exception as e:
        print(f"Error processing circuit: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
