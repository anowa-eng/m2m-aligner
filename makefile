GNUREC=-O3 -ffast-math -funroll-all-loops -fpeel-loops -ftracer -funswitch-loops -funit-at-a-time -pthread
GO=$(GNUREC)
CC=g++ $(GO) 

INCLUDES=-I./tclap-1.2.1/include/ 
CFLAGS=-c $(INCLUDES) 
LDFLAGS=$(LIBS) 
INLIBS= -lpthread -lc -lm

alignSrc=mmAligner.cpp mmEM.cpp
SOURCES=$(alignSrc)
alignObj=$(alignSrc:.cpp=.o)
OBJECTS=$(alignObj)

EXECUTABLE=m2m-aligner

all: $($SOURCES) $(EXECUTABLE)

$(EXECUTABLE):	$(OBJECTS) 
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@ $(INLIBS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:	
	rm -f $(EXECUTABLE) $(OBJECTS)
