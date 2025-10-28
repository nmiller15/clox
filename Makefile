CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -I include

SRC = $(wildcard src/*.c)
OBJDIR = build
OBJ = $(patsubst src/%.c,$(OBJDIR)/%.o,$(SRC))
OUT = clox

$(OUT): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJDIR)/%.o: src/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJDIR) $(OUT)
