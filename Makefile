CC = clang
CFLAGS = -Wall -Wextra -std=c11 -I include

SRC = $(wildcard src/*.c)
OBJDIR = build
OBJ = $(patsubst src/%.c,$(OBJDIR)/%.o,$(SRC))
OUT = clox

# Default build
$(OUT): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compile object files
$(OBJDIR)/%.o: src/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Debug build
debug: CFLAGS += -g -O0
debug: OUT := $(OUT)_debug
debug: clean_obj $(OBJ)
	$(CC) $(CFLAGS) -o $(OUT) $(OBJ)

# Clean object files only
clean_obj:
	rm -rf $(OBJDIR)/*.o

# Full clean
clean:
	rm -rf $(OBJDIR) $(OUT) $(OUT)_debug

