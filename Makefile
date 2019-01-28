OBJS := \
	main.o \
	primes.o \
	primes_in_range.o \

OUTFILE := primes_in_range

.PHONY: all clean

all: $(OUTFILE)

$(OBJS): %.o: %.cpp
	g++ -c -Wall -std=c++14 $< -o $@

$(OUTFILE): $(OBJS)
	g++ $(OBJS) -o $(OUTFILE)
	./$(OUTFILE) 1 10000000 | gzip -9 primes.gz

clean:
	rm -f *.o $(OUTFILE)
