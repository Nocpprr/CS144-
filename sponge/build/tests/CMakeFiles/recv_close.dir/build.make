# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/fpl/SSH/Project_CS144/lab1/sponge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fpl/SSH/Project_CS144/lab1/sponge/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/recv_close.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/recv_close.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/recv_close.dir/flags.make

tests/CMakeFiles/recv_close.dir/recv_close.cc.o: tests/CMakeFiles/recv_close.dir/flags.make
tests/CMakeFiles/recv_close.dir/recv_close.cc.o: ../tests/recv_close.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fpl/SSH/Project_CS144/lab1/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/recv_close.dir/recv_close.cc.o"
	cd /home/fpl/SSH/Project_CS144/lab1/sponge/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/recv_close.dir/recv_close.cc.o -c /home/fpl/SSH/Project_CS144/lab1/sponge/tests/recv_close.cc

tests/CMakeFiles/recv_close.dir/recv_close.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/recv_close.dir/recv_close.cc.i"
	cd /home/fpl/SSH/Project_CS144/lab1/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/fpl/SSH/Project_CS144/lab1/sponge/tests/recv_close.cc > CMakeFiles/recv_close.dir/recv_close.cc.i

tests/CMakeFiles/recv_close.dir/recv_close.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/recv_close.dir/recv_close.cc.s"
	cd /home/fpl/SSH/Project_CS144/lab1/sponge/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/fpl/SSH/Project_CS144/lab1/sponge/tests/recv_close.cc -o CMakeFiles/recv_close.dir/recv_close.cc.s

# Object files for target recv_close
recv_close_OBJECTS = \
"CMakeFiles/recv_close.dir/recv_close.cc.o"

# External object files for target recv_close
recv_close_EXTERNAL_OBJECTS =

tests/recv_close: tests/CMakeFiles/recv_close.dir/recv_close.cc.o
tests/recv_close: tests/CMakeFiles/recv_close.dir/build.make
tests/recv_close: tests/libspongechecks.a
tests/recv_close: libsponge/libsponge.a
tests/recv_close: tests/CMakeFiles/recv_close.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/fpl/SSH/Project_CS144/lab1/sponge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable recv_close"
	cd /home/fpl/SSH/Project_CS144/lab1/sponge/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/recv_close.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/recv_close.dir/build: tests/recv_close

.PHONY : tests/CMakeFiles/recv_close.dir/build

tests/CMakeFiles/recv_close.dir/clean:
	cd /home/fpl/SSH/Project_CS144/lab1/sponge/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/recv_close.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/recv_close.dir/clean

tests/CMakeFiles/recv_close.dir/depend:
	cd /home/fpl/SSH/Project_CS144/lab1/sponge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fpl/SSH/Project_CS144/lab1/sponge /home/fpl/SSH/Project_CS144/lab1/sponge/tests /home/fpl/SSH/Project_CS144/lab1/sponge/build /home/fpl/SSH/Project_CS144/lab1/sponge/build/tests /home/fpl/SSH/Project_CS144/lab1/sponge/build/tests/CMakeFiles/recv_close.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/recv_close.dir/depend

