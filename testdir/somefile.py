import sys

if __name__ == "__main__":
    print("Ran")
    if len(sys.argv) > 1:
        print(f"Argument {sys.argv[1]} passed in")
